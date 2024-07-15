import WinSDK

public class ITfTextInputProcessor: IUnknown {
    override public class var IID: IID { IID_ITfTextInputProcessor }

    public func Activate(
        _ ptim: UnsafeMutablePointer<ITfThreadMgr>?,
        _ clientId: UInt32
    ) throws -> HRESULT {
        return try perform(as: WinSDK.ITfTextInputProcessor.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.Activate(pThis, ptim, clientId))
        }
    }

    public func Deactivate() throws -> HRESULT {
        return try perform(as: WinSDK.ITfTextInputProcessor.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.Deactivate(pThis))
        }
    }
}