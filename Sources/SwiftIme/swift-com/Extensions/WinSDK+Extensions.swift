// Copyright 2020 Saleem Abdulrasool <compnerd@compnerd.org>. All Rights Reserved.
// SPDX-License-Identifier: BSD-3-Clause

// FIXME(compnerd) unfortunately these must be public as they are part of the
// public API.  These really should be vended by WinSDK.
import WinSDK

// winerror.h

// winnt.h
public typealias REFIID = UnsafePointer<IID>
public typealias REFGUID = UnsafePointer<GUID>
public typealias REFCLSID = UnsafePointer<CLSID>
public typealias REFPROPVARIANT = UnsafePointer<PROPVARIANT>
public typealias REFPROPERTYKEY = UnsafePointer<PROPERTYKEY>
public typealias REFWICPixelFormatGUID = UnsafePointer<WICPixelFormatGUID>
internal var E_INVALIDARG: HRESULT {
    HRESULT(bitPattern: 0x8007_0057)
}
internal var E_NOINTERFACE: HRESULT {
    HRESULT(bitPattern: 0x8000_4002)
}
internal var E_FAIL: HRESULT {
    HRESULT(bitPattern: 0x8000_4005)
}
internal var E_NOTIMPL: HRESULT {
    HRESULT(bitPattern: 0x8000_4001)
}
internal var RPC_E_CHANGED_MODE: HRESULT {
    HRESULT(bitPattern: 0x8001_0106)
}
@_transparent
public func MAKELANGID(_ p: WORD, _ s: WORD) -> DWORD {
    return DWORD((s << 10) | p)
}
