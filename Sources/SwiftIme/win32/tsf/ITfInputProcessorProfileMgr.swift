import WinSDK

public class ITfInputProcessorProfileMgr: IUnknown {
    override public class var IID: IID { IID_ITfInputProcessorProfileMgr }

    public func ActivateProfile(
        _ dwProfileType: DWORD,
        _ langid: LANGID,
        _ clsid: REFCLSID,
        _ guidProfile: REFGUID,
        _ hkl: HKL,
        _ dwFlags: DWORD
    ) throws -> HRESULT {
        return try perform(as: WinSDK.ITfInputProcessorProfileMgr.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.ActivateProfile(pThis, dwProfileType, langid, clsid, guidProfile, hkl, dwFlags))
        }
    }

    public func DeactivateProfile(
        _ dwProfileType: DWORD,
        _ langid: LANGID,
        _ clsid: REFCLSID,
        _ guidProfile: REFGUID,
        _ hkl: HKL,
        _ dwFlags: DWORD
    ) throws -> HRESULT {
        return try perform(as: WinSDK.ITfInputProcessorProfileMgr.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.DeactivateProfile(pThis, dwProfileType, langid, clsid, guidProfile, hkl, dwFlags))
        }
    }

    public func EnumProfiles(
        _ langid: LANGID
    ) throws -> IEnumTfInputProcessorProfiles {
        return try perform(as: WinSDK.ITfInputProcessorProfileMgr.self) { pThis in
            var ppEnum: UnsafeMutablePointer<WinSDK.IEnumTfInputProcessorProfiles>?
            try CHECKED(pThis.pointee.lpVtbl.pointee.EnumProfiles(pThis, langid, &ppEnum))
            return ppEnum!.pointee
        }
    }

    public func GetActiveProfile(
        _ catid: REFGUID
    ) throws -> TF_INPUTPROCESSORPROFILE {
        return try perform(as: WinSDK.ITfInputProcessorProfileMgr.self) { pThis in
            var profile = TF_INPUTPROCESSORPROFILE()
            try CHECKED(pThis.pointee.lpVtbl.pointee.GetActiveProfile(pThis, catid, &profile))
            return profile
        }
    }

    public func GetProfile(
        _ dwProfileType: DWORD,
        _ langid: LANGID,
        _ clsid: REFCLSID,
        _ guidProfile: REFGUID,
        _ hkl: HKL
    ) throws -> TF_INPUTPROCESSORPROFILE {
        return try perform(as: WinSDK.ITfInputProcessorProfileMgr.self) { pThis in
            var profile = TF_INPUTPROCESSORPROFILE()
            try CHECKED(pThis.pointee.lpVtbl.pointee.GetProfile(pThis, dwProfileType, langid, clsid, guidProfile, hkl, &profile))
            return profile
        }
    }

    public func RegisterProfile(
        _ rclsid: REFCLSID,
        _ langid: LANGID,
        _ guidProfile: REFGUID,
        _ pchDesc: Optional<UnsafePointer<CWideChar>>,
        _ cchDesc: ULONG,
        _ pchIconFile: Optional<UnsafePointer<CWideChar>>,
        _ cchFile: ULONG,
        _ uIconIndex: ULONG,
        _ hklsubstitute: HKL,
        _ dwPreferredLayout: DWORD,
        _ bEnabledByDefault: WindowsBool,
        _ dwFlags: DWORD
    ) throws -> HRESULT {
        return try perform(as: WinSDK.ITfInputProcessorProfileMgr.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterProfile(pThis, rclsid, langid, guidProfile, pchDesc, cchDesc, pchIconFile, cchFile, uIconIndex, hklsubstitute, dwPreferredLayout, bEnabledByDefault, dwFlags))
        }
    }

    public func ReleaseInputProcessor(
        _ rclsid: REFCLSID,
        _ dwFlags: DWORD
    ) throws -> HRESULT {
        return try perform(as: WinSDK.ITfInputProcessorProfileMgr.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.ReleaseInputProcessor(pThis, rclsid, dwFlags))
        }
    }

    public func UnregisterProfile(
        _ rclsid: REFCLSID,
        _ langid: LANGID,
        _ guidProfile: REFGUID,
        _ dwFlags: DWORD
    ) throws -> HRESULT {
        return try perform(as: WinSDK.ITfInputProcessorProfileMgr.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.UnregisterProfile(pThis, rclsid, langid, guidProfile, dwFlags))
        }
    }
}

