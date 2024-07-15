import WinSDK

public class ClassFactory {
    typealias CreateFn = (
        UnsafePointer<GUID>,
        UnsafeMutablePointer<UnsafeMutableRawPointer?>
    ) -> HRESULT

    var ref = 1
    var create_fn: CreateFn?

    func QueryInterface(_ riid: REFIID, _ ppvObject: UnsafeMutablePointer<UnsafeMutableRawPointer?>) -> HRESULT {
        let iid = riid.pointee
        if !(iid == IClassFactory.IID || iid == IUnknown.IID) {
            ppvObject.pointee = nil
            return E_NOINTERFACE
        }

        defer {
            ppvObject.deallocate()
        }
        // ppvObject.initialize(to: Unmanaged.passUnretained(self).toOpaque())
        // ppvObject.pointee = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        // _ = ppvObject.move()

        _ = self.AddRef()
        return S_OK
    }

    func AddRef() -> ULONG {
        ref += 1
        return ULONG(ref)
    }

    func Release() -> ULONG {
        ref -= 1
        let ref = ref
        if ref == 0 {
            ref_count -= 1
            _ = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        }
        return ULONG(ref)
    }

    func createInstance(
        _ pUnkOuter: UnsafeMutablePointer<WinSDK.IUnknown>?,
        _ riid: UnsafeMutablePointer<GUID>, 
        _ ppvObject: UnsafeMutablePointer<UnsafeMutableRawPointer?>
    ) -> HRESULT {
        if (pUnkOuter != nil) {
            return CLASS_E_NOAGGREGATION
        }

        do {
            if let create_fn = create_fn {
                return create_fn(riid, ppvObject)
            } else {
                return CLASS_E_NOAGGREGATION
            }
        } catch {
            return HRESULT(error._code)
        }
    }

    func LockServer(
        _ fLock: WindowsBool
    ) -> HRESULT {
        if fLock.boolValue {
            ref_lock += 1
        } else {
            ref_lock -= 1
        }

        return S_OK
    }


    func create(
        create_fn_c: @escaping CreateFn,
        riid: REFIID,
        ppvObject: UnsafeMutablePointer<UnsafeMutableRawPointer?>
    ) -> HRESULT {
        create_fn = create_fn_c
        ref = 1

        let result = self.QueryInterface(riid, ppvObject)
        _ = self.Release()
        ref_count += 1

        return result
    }
}  

