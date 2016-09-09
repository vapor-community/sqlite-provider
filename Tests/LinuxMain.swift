#if os(Linux)

import XCTest
@testable import VaporSQLiteTests

XCTMain([
    testCase(SQLiteTests.allTests),
])

#endif