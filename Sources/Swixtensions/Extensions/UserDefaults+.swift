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
    func decodedValue<T: Codable>(forKey key: String, dateDecodingStrategy: JSONDecoder.DataDecodingStrategy? = nil) -> T? {
        var value: Data

        #if DEBUG
        if CommandLine.arguments.contains("--uiTest") {
            if let data = self.value(forKey: key) as? Data {
                value = data
            } else if let string = self.value(forKey: key) as? String {
                guard let data = try? Data.from(string) else { return nil }
                
                value = data
            } else {
                return nil
            }
        } else {
            guard let data = self.value(forKey: key) as? Data else { return nil }
            value = data
        }
        #else
        guard let data = self.value(forKey: key) as? Data else { return nil }
        value = data
        #endif

        let decoder = JSONDecoder()

        if let dateDecodingStrategy = dateDecodingStrategy {
            decoder.dataDecodingStrategy = dateDecodingStrategy
        } else {
            decoder.dateDecodingStrategy = .deferredToDate
        }

        guard let decoded = try? decoder.decode(T.self, from: value) else { return nil }

        return decoded
    }

    func set<T: Codable>(_ value: T, forKey key: String) throws {
        do {
            let encoded = try JSONEncoder().encode(value)

            self.setValue(encoded, forKey: key)
        } catch {
            throw UserDefaults.Error.encodingFailed(error)
        }
    }
}
