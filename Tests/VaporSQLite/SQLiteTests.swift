import XCTest
@testable import VaporSQLite
import Fluent

class SQLiteTests: XCTestCase {
    static let allTests = [
        ("testReality", testReality)
    ]

    func testReality() {
        XCTAssert(2 + 2 == 4, "Something is seriously wrong.")
    }
}
