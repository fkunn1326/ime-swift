// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import WinSDK

func showMessageBox(title: String, message: String) {
    title.withCString { titlePtr in
        message.withCString { messagePtr in
            _ = MessageBoxA(nil, messagePtr, titlePtr, UINT(MB_OK))
        }
    }
}

@_cdecl("DllCanUnloadNow")
public func DllCanUnloadNow() -> HRESULT{
    showMessageBox(title: "DllCanUnloadNow", message: "from swift")
    return S_OK
}

@_cdecl("DllGetClassObject")
public func DllGetClassObject() -> HRESULT {
    showMessageBox(title: "DllGetClassObject", message: "from swift")
    return S_OK
}

@_cdecl("DllRegisterServer")
public func DllRegisterServer() -> HRESULT {
    showMessageBox(title: "DllRegisterServer", message: "from swift")
    return S_OK
}

@_cdecl("DllUnregisterServer")
public func DllUnregisterServer() -> HRESULT {
    showMessageBox(title: "DllUnregisterServer", message: "from swift")
    return S_OK
}