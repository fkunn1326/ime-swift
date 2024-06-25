import WinSDK

// fromStringとtoString
public extension GUID {
    init(fromString string: String) {
        let components = string.split(separator: "-")
        guard components.count == 5 else {
            fatalError("Invalid GUID string")
        }
        
        guard
            let data1 = UInt32(components[0], radix: 16),
            let data2 = UInt16(components[1], radix: 16),
            let data3 = UInt16(components[2], radix: 16),
            let data4Part1 = UInt8(components[3].prefix(2), radix: 16),
            let data4Part2 = UInt8(components[3].suffix(2), radix: 16),
            components[4].count == 12 else {
                fatalError("Invalid GUID string")
            }
        
        let data4 = (0..<6).compactMap { index -> UInt8? in
            let startIndex = components[4].index(components[4].startIndex, offsetBy: index * 2)
            let endIndex = components[4].index(startIndex, offsetBy: 2)
            return UInt8(components[4][startIndex..<endIndex], radix: 16)
        }
        
        guard data4.count == 6 else { 
            fatalError("Invalid GUID string")
        }
        
        let guid = GUID(
            Data1: data1,
            Data2: data2,
            Data3: data3,
            Data4: (data4Part1, data4Part2, data4[0], data4[1], data4[2], data4[3], data4[4], data4[5])
        )

        self = guid        
    }
    func toString() -> String {
        let data4 = Data4
        return String(format: "{%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X}", Data1, Data2, Data3, data4.0, data4.1, data4.2, data4.3, data4.4, data4.5, data4.6, data4.7)
    }
}

var CLSID_TF_InputProcessorProfiles: GUID = GUID(fromString: "33c53a50-f456-4884-b049-85fd643ecfed")