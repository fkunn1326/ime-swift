import WinSDK

func RegCreateAndWriteKey(path: HKEY, subKey: String, name: String?, value: String) -> Bool {
    var hkey = HKEY(bitPattern: 0)

    // create key
    let create_hr = RegCreateKeyExA(
        path,
        subKey,
        0,
        nil,
        DWORD(REG_OPTION_NON_VOLATILE),
        // KEY_WRITEがない
        REGSAM(KEY_CREATE_SUB_KEY | KEY_SET_VALUE),
        nil,
        &hkey,
        nil
    )

    if create_hr != ERROR_SUCCESS {
        return false
    }

    // write value
    let data = Array(value.utf8) + [0]
    let write_hr = RegSetKeyValueA(
        path,
        subKey,
        name,
        DWORD(REG_SZ),
        data,
        DWORD(data.count)
    )

    _ = RegCloseKey(hkey)

    if write_hr != ERROR_SUCCESS {
        return false
    }

    return true
}

func RegDeleteTree(path: HKEY, subKey: String) -> Bool {
    let hr = RegDeleteTreeA(path, subKey)
    return hr == ERROR_SUCCESS
}