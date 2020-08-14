//
//  Int32+.swift
//  
//
//  Created by Branden Smith on 8/14/20.
//

import Foundation

extension Int32 {
    func compactMap<T>(_ transform: (Int32) -> T?) -> T? {
        return transform(self)
    }

    func map<T>(_ transform: (Int32) -> T) -> T {
        return transform(self)
    }
}
