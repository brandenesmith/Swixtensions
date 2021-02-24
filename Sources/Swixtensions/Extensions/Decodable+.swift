//
//  Decodable+.swift
//  
//
//  Created by Branden Smith on 2/24/21.
//

import Foundation

public extension Decodable {
    static func decode(from data: Data) throws -> Self {
        let decoded = try JSONDecoder().decode(Self.self, from: data)

        return decoded
    }
}
