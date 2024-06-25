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