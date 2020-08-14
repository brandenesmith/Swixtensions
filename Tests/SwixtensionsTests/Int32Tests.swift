//
//  Int32Tests.swift
//  
//
//  Created by Branden Smith on 8/14/20.
//

import XCTest
@testable import Swixtensions

final class Int32Tests: XCTestCase {
    func testCompactMap() {
        let int = Int32(1)

        if let _: AnyObject? = int.compactMap({ _ in return nil }) {
            XCTAssert(false, "Compact map should return nil in this case")
        } else {
            XCTAssert(true)
        }

        if let _: String? = int.compactMap({ return "\($0)" }) {
            XCTAssert(true)
        } else {
            XCTAssert(false, "Expected to get the string \"1\"")
        }
    }

    func testMap() {
        let int = Int32(25)

        XCTAssertEqual(
            int.map({ return $0 * 10 }),
            250,
            "expected map to return 250"
        )
    }

    static var allTests = [
        ("testCompactMap", testCompactMap),
        ("testMap", testMap)
    ]
}
