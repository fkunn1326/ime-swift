import WinSDK


public class ClassFactory: IClassFactory {
    override public class var IID: IID { IID_IClassFactory }

    public func CreateInstance(
        pUnkOuter: UnsafeMutablePointer<UnsafeMutableRawPointer>,
        riid: UnsafePointer<GUID>,
        ppvObject: UnsafeMutablePointer<UnsafeMutableRawPointer>
    ) throws -> HRESULT {
        let riid = riid.pointee

        if pUnkOuter.pointee != nil {
            return CLASS_E_NOAGGREGATION
        }

        if !(riid == ITfTextInputProcessor.IID) && !(riid == IUnknown.IID) {
            return E_NOINTERFACE
        }

        let instance = TextService(
            pUnk: nil
        ) as IUnknown

        let pointer = Unmanaged.passUnretained(instance as AnyObject).toOpaque()
        ppvObject.pointee = UnsafeMutableRawPointer(pointer)

        return S_OK
    }

    public func LockServer(fLock: Bool) -> HRESULT {
        return S_OK
    }
}  

