//
//  Bundle+.swift
//  
//
//  Created by Branden Smith on 9/21/20.
//

import Foundation

public extension Bundle {
    func getPlistProperty<T>(key: String, inPlistNamed plistName: String) -> T? {
        guard let plistPath = Bundle.main.path(forResource: plistName, ofType: "plist") else { return nil }
        guard let contents = FileManager.default.contents(atPath: plistPath) else { return nil }

        guard
            let propertyList = try? PropertyListSerialization
                .propertyList(from: contents, options: .mutableContainers, format: nil) as? [String: Any] else {
            return nil
        }

        return propertyList[key] as? T
    }
}
