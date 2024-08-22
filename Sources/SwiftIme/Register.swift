// Register
import WinSDK

let clsid_key = CLSID_PREFIX + GUID_TEXT_SERVICE.toString()
let inproc_key = clsid_key + INPROC_SUFFIX

func register_profiles(path: String) -> UnsafeMutableRawPointer?{
    let pointer = ComGetPointer(rclsid: CLSID_TF_InputProcessorProfiles, riid: IID_ITfInputProcessorProfileMgr)
    let profile_mgr: ITfInputProcessorProfileMgr = ITfInputProcessorProfileMgr(pUnk: pointer)
    
    let service_name: UnsafeMutablePointer<wchar_t>? = convertCharToWchar(SERVICE_NAME)
    let rc_path: UnsafeMutablePointer<wchar_t>? = convertCharToWchar(path)

    let result: UnsafeMutableRawPointer? = nil
    let hkl = UnsafeMutablePointer<HKL>.allocate(capacity: 1)
    
    let _ = try? profile_mgr.RegisterProfile(
        &GUID_TEXT_SERVICE,
        LANG_ID,
        &GUID_PROFILE,
        service_name,
        ULONG(wcslen(service_name)),
        rc_path,
        ULONG(wcslen(rc_path)),
        0,
        hkl.pointee,
        0,
        true,
        0
    ) 

    return result
}

func unregister_profiles() -> Bool {
    let pointer = ComGetPointer(rclsid: CLSID_TF_InputProcessorProfiles, riid: IID_ITfInputProcessorProfileMgr)
    let profile_mgr: ITfInputProcessorProfileMgr = ITfInputProcessorProfileMgr(pUnk: pointer)

    let hr = try? profile_mgr.UnregisterProfile(&GUID_TEXT_SERVICE, LANG_ID, &GUID_PROFILE, 0)
    if hr != S_OK {
        print(message: "Failed to unregister profile")
        return false
    }
    return true
}

func register_categories() -> Bool {
    let pointer = ComGetPointer(rclsid: CLSID_TF_CategoryMgr, riid: IID_ITfCategoryMgr)
    let catmgr = ITfCategoryMgr(pUnk: pointer)

    let categories = [
        GUID_TFCAT_DISPLAYATTRIBUTEPROVIDER,
        GUID_TFCAT_TIPCAP_COMLESS,
        GUID_TFCAT_TIPCAP_INPUTMODECOMPARTMENT,
        GUID_TFCAT_TIPCAP_UIELEMENTENABLED,
        GUID_TFCAT_TIP_KEYBOARD,
        GUID_TFCAT_TIPCAP_IMMERSIVESUPPORT,
        GUID_TFCAT_TIPCAP_SYSTRAYSUPPORT,
    ]

    for var category in categories {
        let hr = try? catmgr.RegisterCategory(&GUID_TEXT_SERVICE, &category, &GUID_TEXT_SERVICE)
        if hr != S_OK {
            print(message: "Failed to register category")
            return false
        }
    }
    return true
}

func unregister_categories() -> Bool {
    let pointer = ComGetPointer(rclsid: CLSID_TF_CategoryMgr, riid: IID_ITfCategoryMgr)
    let catmgr = ITfCategoryMgr(pUnk: pointer)

    let categories = [
        GUID_TFCAT_DISPLAYATTRIBUTEPROVIDER,
        GUID_TFCAT_TIPCAP_COMLESS,
        GUID_TFCAT_TIPCAP_INPUTMODECOMPARTMENT,
        GUID_TFCAT_TIPCAP_UIELEMENTENABLED,
        GUID_TFCAT_TIP_KEYBOARD,
        GUID_TFCAT_TIPCAP_IMMERSIVESUPPORT,
        GUID_TFCAT_TIPCAP_SYSTRAYSUPPORT,
    ]

    for var category in categories {
        let hr = try? catmgr.UnregisterCategory(&GUID_TEXT_SERVICE, &category, &GUID_TEXT_SERVICE)
        if hr != S_OK {
            print(message: "Failed to unregister category")
            return false
        }
    }
    return true

}

func register_clsid(path: String) -> Bool{
    let clsid_hr = RegCreateAndWriteKey(path: HKEY_CLASSES_ROOT, subKey: clsid_key, name: nil, value: SERVICE_NAME)
    if !clsid_hr {
        return false
    }

    let inproc_hr = RegCreateAndWriteKey(path: HKEY_CLASSES_ROOT, subKey: inproc_key, name: nil, value: path)
    if !inproc_hr {
        print(message: "Failed to create InProcServer32 key")
        return false
    }

    let threading_hr = RegCreateAndWriteKey(path: HKEY_CLASSES_ROOT, subKey: inproc_key, name: "ThreadingModel", value: "Apartment")
    if !threading_hr {
        print(message: "Failed to create ThreadingModel key")
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