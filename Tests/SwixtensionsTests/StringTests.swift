//
//  StringTests.swift
//  
//
//  Created by Branden Smith on 8/28/20.
//

import XCTest
@testable import Swixtensions

final class StringTests: XCTestCase {
    func testRemovingCharactersInSet() {
        XCTAssertEqual("123Abc123".removing(charactersInSet: .decimalDigits), "Abc")
        XCTAssertEqual("123Abc123".removing(charactersInSet: .alphanumerics), "")
    }

    func testInitials() {
        XCTAssertEqual("Apple Computers".initials(), "AC")
        XCTAssertEqual("Apple Computers".initials(length: 3), "ACO")
        XCTAssertEqual("Appl".initials(), "AP")
    }

    static var allTests = [
        ("testRemovingCharactersInSet", testRemovingCharactersInSet),
        ("testInitials", testInitials)
    ]
}
