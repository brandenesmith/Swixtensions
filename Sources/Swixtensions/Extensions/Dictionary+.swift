//
//  Dictionary+.swift
//  
//
//  Created by Branden Smith on 9/11/20.
//

import Foundation

public extension Dictionary {

    /// Combines two dictionaries and returns the result.
    /// - Parameters:
    ///   - lhs: A dictionary `Dictionary<Key, Value>`
    ///   - rhs: An optional dictionary `Dictionary<Key, Value>?`
    /// - Returns: The result of combining `rhs` with `lhs` where if the key
    ///            already exists in `lhs` it is unchanged otherwise it is added to the result.
    ///
    ///            Note: If rhs is nil, lhs is returned.
    static func +(_ lhs: [Key: Value], _ rhs: [Key: Value]?) -> [Key: Value] {
        guard let right = rhs else { return lhs }

        return right.reduce(into: lhs) { (result, keyValuePair) in
            guard result[keyValuePair.key] == nil else { return }

            result[keyValuePair.key] = keyValuePair.value
        }
    }
}
