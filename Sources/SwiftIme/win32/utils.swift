import WinSDK

// get current dll path
func getDLLPath() -> String? {
    var hModule: HMODULE?

    let m_hr = GetModuleHandleExA(DWORD(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS), #dsohandle, &hModule)
    if m_hr == false {
        return nil
    }

    var pathBuffer = [CChar](repeating: 0, count: Int(MAX_PATH))
    
    let length = GetModuleFileNameA(hModule, &pathBuffer, DWORD(MAX_PATH))
    
    if length == 0 {
        return nil
    }
    
    return String(cString: pathBuffer)
}

func ComGetPointer(rclsid: CLSID, riid: IID) -> UnsafeMutableRawPointer? {
    var pointer: UnsafeMutableRawPointer?
    var clsid = rclsid
    var iid = riid

    let hr_create = CoCreateInstance(
        &clsid, nil, DWORD(CLSCTX_INPROC_SERVER.rawValue), &iid, &pointer
    )
    
    if hr_create != S_OK {
        print(message: "Failed to create instance of \(clsid.toString())")
        return nil
    }

    return pointer
}