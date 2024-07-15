// Globals (Global variables)
import WinSDK

let CLSID_PREFIX: String = "CLSID\\"
let INPROC_SUFFIX: String = "\\InProcServer32"

let SERVICE_NAME: String = "Azookey"

var GUID_TEXT_SERVICE: GUID = GUID(fromString: "ffdefe79-2fc2-11ef-b16b-94e70b2c378c")
var GUID_PROFILE: GUID = GUID(fromString: "ffdefe7a-2fc2-11ef-b16b-94e70b2c378c")

var LANG_ID: LANGID = LANGID(MAKELANGID(WORD(LANG_JAPANESE), WORD(SUBLANG_DEFAULT)))

var ref_count: Int32 = 0
var ref_lock: Int32 = 0

// system
let CLASS_E_NOAGGREGATION = HRESULT(bitPattern: 0x80040110)
var g_serverLocks: LONG = 0
