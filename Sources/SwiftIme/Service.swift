import WinSDK

public class TextService {
    public var ref = 1

    public func QueryInterface(_ riid: REFIID, _ ppvObject: UnsafeMutablePointer<UnsafeMutableRawPointer?>) -> HRESULT {
        let iid = riid.pointee
        if !(iid == ITfTextInputProcessor.IID || iid == IUnknown.IID) {
            ppvObject.pointee = nil
            return E_NOINTERFACE
        }

        // ppvObject.pointee = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        _ = self.AddRef()
        return S_OK
    }

    public func AddRef() -> ULONG {
        ref += 1
        return ULONG(ref)
    }

    public func Release() -> ULONG {
        ref -= 1
        if ref == 0 {
            ref_count -= 1
            _ = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
        }
        return ULONG(ref)
    }

    public func create(
        _ riid: REFIID,
        _ ppvObject: UnsafeMutablePointer<UnsafeMutableRawPointer?>
    ) -> HRESULT {

        let result = self.QueryInterface(riid, ppvObject)
        _ = self.Release()
        ref_count += 1
        return result
    }
}

