//
//  UserDefaults+.swift
//  
//
//  Created by Branden Smith on 8/13/20.
//

import Foundation

public extension UserDefaults {
    enum Error: Swift.Error {
        case encodingFailed(Swift.Error)
    }
}

public extension UserDefaults {
    func decodedValue<T: Codable>(forKey key: String) -> T? {
        guard let value = self.value(forKey: key) as? Data else { return nil }
        guard let decoded = try? JSONDecoder().decode(T.self, from: value) else { return nil }

        return decoded
    }

    func set<T: Codable>(_ value: T, forKey key: String) throws {
        do {
            let encoded = try JSONEncoder().encode(value)
            let data = try JSONSerialization.data(withJSONObject: encoded, options: [])

            self.setValue(data, forKey: key)
        } catch {
            throw UserDefaults.Error.encodingFailed(error)
        }
    }
}
