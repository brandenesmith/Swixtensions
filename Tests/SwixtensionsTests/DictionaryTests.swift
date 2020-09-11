//
//  DictionaryTests.swift
//  
//
//  Created by Branden Smith on 9/11/20.
//

import XCTest
@testable import Swixtensions

final class DictionaryTests: XCTestCase {
    func testLeftPlusRightBasic() {
        let left = [
            "Key1": "Value1",
            "Key2": "Value2"
        ]

        let right = [
            "Key3": "Value3",
            "Key4": "Value4"
        ]

        let expectedResult = [
            "Key1": "Value1",
            "Key2": "Value2",
            "Key3": "Value3",
            "Key4": "Value4"
        ]

        XCTAssert(left + right == expectedResult)
    }

    func testLeftPlusRightWhenRightIsNil() {
        let left = [
            "Key1": "Value1",
            "Key2": "Value2"
        ]

        let expectedResult = [
            "Key1": "Value1",
            "Key2": "Value2"
        ]

        XCTAssert(left + nil == expectedResult)
    }

    func textLeftPlusRightWhereKeyAlreadyExists() {
        let left = [
            "Key1": "Value1",
            "Key2": "Value2"
        ]

        let right = [
            "Key2": "OtherValue2",
            "Key3": "Value3"
        ]

        let expectedResult = [
            "Key1": "Value1",
            "Key2": "Value2",
            "Key3": "Value3",
        ]

        XCTAssert(left + right == expectedResult)
    }

    static var allTests = [
        ("testLeftPlusRightBasic", testLeftPlusRightBasic),
        ("testLeftPlusRightWhenRightIsNil", testLeftPlusRightWhenRightIsNil),
        ("textLeftPlusRightWhereKeyAlreadyExists", textLeftPlusRightWhereKeyAlreadyExists)
    ]
}
