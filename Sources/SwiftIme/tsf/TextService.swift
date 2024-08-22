import WinSDK

public class TextService: IUnknown {
    override public class var IID: IID { IID_ITfTextInputProcessor }

    public func Activate(
        _ ptim: UnsafeMutablePointer<ITfThreadMgr>?,
        _ clientId: UInt32
    ) -> HRESULT {
        S_OK
    }

    public func Deactivate() -> HRESULT {
        S_OK
    }
}