// Register
import WinSDK

let clsid_key = CLSID_PREFIX + GUID_TEXT_SERVICE.toString()
let inproc_key = clsid_key + INPROC_SUFFIX

func register_profiles() -> UnsafeMutableRawPointer?{
    var pointer: UnsafeMutableRawPointer?
    let hr = CoCreateInstance(
        &CLSID_TF_InputProcessorProfiles, nil, DWORD(CLSCTX_INPROC_SERVER.rawValue), nil, &pointer
    )


    if hr != S_OK {
        print("Failed to create instance of CLSID_TF_InputProcessorProfiles")
        return nil
    }

    return pointer
}

func register_clsid(path: String) -> Bool{

    let clsid_hr = RegCreateAndWriteKey(path: HKEY_CLASSES_ROOT, subKey: clsid_key, name: nil, value: SERVICE_NAME)
    if !clsid_hr {
        return false
    }

    let inproc_hr = RegCreateAndWriteKey(path: HKEY_CLASSES_ROOT, subKey: inproc_key, name: nil, value: path)
    if !inproc_hr {
        print("Failed to create InProcServer32 key")
        return false
    }

    let threading_hr = RegCreateAndWriteKey(path: HKEY_CLASSES_ROOT, subKey: inproc_key, name: "ThreadingModel", value: "Apartment")
    if !threading_hr {
        print("Failed to create ThreadingModel key")
        return false
    }

    return true
}

func unregister_clsid() -> Bool {
    let clsid_hr = RegDeleteTree(path: HKEY_CLASSES_ROOT, subKey: clsid_key)
    if !clsid_hr {
        return false
    }
    let inproc_hr = RegDeleteTree(path: HKEY_CLASSES_ROOT, subKey: inproc_key)
    if !inproc_hr {
        return false
    }
    return true
}