import WinSDK

public class ITfCategoryMgr: IUnknown {
    override public class var IID: IID { IID_ITfCategoryMgr }
	
    public func RegisterCategory(
        _ rclsid: UnsafePointer<GUID>,
        _ rcatid: UnsafePointer<GUID>,
        _ rguid: UnsafePointer<GUID>
    ) throws -> HRESULT {
        return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterCategory(pThis, rclsid, rcatid, rguid))
        }
    }

    public func UnregisterCategory(
        _ rclsid: UnsafePointer<GUID>,
        _ rcatid: UnsafePointer<GUID>,
        _ rguid: UnsafePointer<GUID>
    ) throws -> HRESULT {
        return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
            try CHECKED(pThis.pointee.lpVtbl.pointee.UnregisterCategory(pThis, rclsid, rcatid, rguid))
        }
    }

	public func EnumCategoriesInItem(
		_ rguid: UnsafePointer<GUID>
	) throws -> IEnumGUID {
		var ppEnum: UnsafeMutablePointer<IEnumGUID>?
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			try CHECKED(pThis.pointee.lpVtbl.pointee.EnumCategoriesInItem(pThis, rguid, &ppEnum))
			return ppEnum!.pointee
		}
	}

	public func EnumItemsInCategory(
		_ rcatid: UnsafePointer<GUID>
	) throws -> IEnumGUID {
		var ppEnum: UnsafeMutablePointer<IEnumGUID>?
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			try CHECKED(pThis.pointee.lpVtbl.pointee.EnumItemsInCategory(pThis, rcatid, &ppEnum))
			return ppEnum!.pointee
		}
	}

	public func FindClosestCategory(
		_ rguid: UnsafePointer<GUID>,
		_ pcatid: UnsafeMutablePointer<GUID>,
		_ ppcatidList: UnsafePointer<GUID>?,
		_ ulCount: UInt32
	) throws -> HRESULT {
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			var pcatidList: UnsafePointer<GUID>? = ppcatidList
			return try CHECKED(pThis.pointee.lpVtbl.pointee.FindClosestCategory(pThis, rguid, pcatid, &pcatidList, ulCount))
		}
	}

	public func RegisterGUIDDescription(
		_ rclsid: UnsafePointer<GUID>,
		_ rguid: UnsafePointer<GUID>,
		_ pchDesc: UnsafePointer<WCHAR>,
		_ cch: UInt32
	) throws -> HRESULT {
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			return try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterGUIDDescription(pThis, rclsid, rguid, pchDesc, cch))
		}
	}

	public func UnregisterGUIDDescription(
		_ rclsid: UnsafePointer<GUID>,
		_ rguid: UnsafePointer<GUID>
	) throws -> HRESULT {
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			return try CHECKED(pThis.pointee.lpVtbl.pointee.UnregisterGUIDDescription(pThis, rclsid, rguid))
		}
	}

	public func GetGUIDDescription(
		_ rguid: UnsafePointer<GUID>
	) throws -> BSTR {
		var pbstrDesc: BSTR?
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			try CHECKED(pThis.pointee.lpVtbl.pointee.GetGUIDDescription(pThis, rguid, &pbstrDesc))
			return pbstrDesc!
		}
	}

	public func RegisterGUIDDWORD(
		_ rclsid: UnsafePointer<GUID>,
		_ rguid: UnsafePointer<GUID>,
		_ dw: UInt32
	) throws -> HRESULT {
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			return try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterGUIDDWORD(pThis, rclsid, rguid, dw))
		}
	}

	public func UnregisterGUIDDWORD(
		_ rclsid: UnsafePointer<GUID>,
		_ rguid: UnsafePointer<GUID>
	) throws -> HRESULT {
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			return try CHECKED(pThis.pointee.lpVtbl.pointee.UnregisterGUIDDWORD(pThis, rclsid, rguid))
		}
	}

	public func GetGUIDDWORD(
		_ rguid: UnsafePointer<GUID>
	) throws -> UInt32 {
		var pdw: UInt32 = .zero
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			try CHECKED(pThis.pointee.lpVtbl.pointee.GetGUIDDWORD(pThis, rguid, &pdw))
			return pdw
		}
	}

	public func RegisterGUID(
		_ rguid: UnsafePointer<GUID>,
		_ pguidatom: UnsafeMutablePointer<UINT>
	) throws -> HRESULT {
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			return try CHECKED(pThis.pointee.lpVtbl.pointee.RegisterGUID(pThis, rguid, pguidatom))
		}
	}

	public func GetGUID(
		_ guidatom: UINT
	) throws -> GUID {
		var pguid: GUID = GUID()
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			try CHECKED(pThis.pointee.lpVtbl.pointee.GetGUID(pThis, guidatom, &pguid))
			return pguid
		}
	}

	public func IsEqualTfGuidAtom(
		_ guidatom: UINT,
		_ rguid: UnsafePointer<GUID>,
		_ pfEqual: UnsafeMutablePointer<WindowsBool>
	) throws -> HRESULT {
		return try perform(as: WinSDK.ITfCategoryMgr.self) { pThis in
			return try CHECKED(pThis.pointee.lpVtbl.pointee.IsEqualTfGuidAtom(pThis, guidatom, rguid, pfEqual))
		}
	}
}