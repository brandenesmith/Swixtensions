//
//  JSONDecoderTests.swift
//  
//
//  Created by Branden Smith on 10/6/20.
//

import XCTest
@testable import Swixtensions

struct Person: Codable, Equatable {
    let name: String
    let age: Int
}

final class JSONDecoderTests: XCTestCase {
    func testDecodeFromDictionary() {
        let personDict: [String: Any] = [
            "name": "Steve",
            "age": 50
        ]

        let decoded: Person = try! JSONDecoder().decode(Person.self, from: personDict)

        XCTAssert(decoded == Person(name: "Steve", age: 50))
    }

    static var allTests = [
        ("testDecodeFromDictionary", testDecodeFromDictionary)
    ]
}
