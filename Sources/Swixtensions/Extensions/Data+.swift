//
//  Data+.swift
//  
//
//  Created by Branden Smith on 4/30/21.
//

import Foundation

internal extension Data {
    enum ConversionError: Swift.Error {
        case foundNonIntCharacter
    }

    static func from(_ string: String) throws -> Data {
        var bytes: [UInt8] = []

        let byteRepresentations = string.split(separator: " ")

        for byteRep in byteRepresentations {
            guard let byte = UInt8(String(byteRep)) else {
                throw ConversionError.foundNonIntCharacter
            }

            bytes.append(byte)
        }

        return Data(bytes: &bytes, count: bytes.count)
    }
}
