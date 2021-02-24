//
//  Encodable+.swift
//  
//
//  Created by Branden Smith on 2/24/21.
//

import Foundation

public extension Encodable {
    func encode() throws -> Data {
        let encoded = try JSONEncoder().encode(self)

        return encoded
    }
}
