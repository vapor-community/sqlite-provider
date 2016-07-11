#if os(Linux)

import XCTest
@testable import VaporSQLiteTestSuite

XCTMain([
    testCase(SQLiteTests.allTests),
])

#endif