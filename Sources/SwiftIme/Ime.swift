// Main entry point for DLL

import Foundation
import WinSDK

func showMessageBox(title: String, message: String) {
    title.withCString { titlePtr in
        message.withCString { messagePtr in
            _ = MessageBoxA(nil, messagePtr, titlePtr, UINT(MB_OK))
        }
    }
}

func print(message: String) {
    "debug".withCString { titlePtr in
        message.withCString { messagePtr in
            _ = MessageBoxA(nil, messagePtr, titlePtr, UINT(MB_OK))
        }
    }
}

@_cdecl("DllCanUnloadNow")
public func DllCanUnloadNow() -> HRESULT{
    return S_OK
}

@_cdecl("DllGetClassObject")
public func DllGetClassObject(rclsid: REFCLSID, riid: REFIID, ppv: UnsafeMutablePointer<UnsafeMutableRawPointer?>) -> HRESULT {
    return S_OK
}

@_cdecl("DllRegisterServer")
public func DllRegisterServer() -> HRESULT {
    let path = getDLLPath()
    _ = register_clsid(path: path ?? "")
    _ = register_profiles(path: path ?? "")
    _ = register_categories()
    return S_OK
}

@_cdecl("DllUnregisterServer")
public func DllUnregisterServer() -> HRESULT {
    showMessageBox(title: "DllUnregisterServer", message: "from swift")
    _ = unregister_clsid()
    _ = unregister_profiles()
    _ = unregister_categories()
    return S_OK
}