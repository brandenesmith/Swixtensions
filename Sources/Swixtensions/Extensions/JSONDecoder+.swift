//
//  JSONDecoder+.swift
//  
//
//  Created by Branden Smith on 10/6/20.
//

import Foundation

public extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from dictionary: [String: Any]) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: [.fragmentsAllowed])

        return try self.decode(type, from: data)
    }
}
