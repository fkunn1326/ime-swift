import WinSDK

public class IClassFactory: IUnknown {
    override public class var IID: IID { IID_IClassFactory }

    public func CreateInstance(
        _ pUnkOuter: UnsafeMutablePointer<WinSDK.IUnknown>?,
        _ riid: UnsafeMutablePointer<GUID>, 
        _ ppvObject: UnsafeMutablePointer<UnsafeMutableRawPointer?>
    ) throws -> HRESULT {
        return try perform(as: WinSDK.IClassFactory.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.CreateInstance(pThis, pUnkOuter, riid, ppvObject))
        }
    }

    public func LockServer(
        _ fLock: WindowsBool
    ) throws -> HRESULT {
        return try perform(as: WinSDK.IClassFactory.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.LockServer(pThis, fLock))
        }
    }
}
