import XCTest
@testable import VaporSQLite
import Fluent
import Vapor

class SQLiteTests: XCTestCase {
    static let allTests = [
        ("testProviderBoot", testProviderBoot),
        ]
    
    func testProviderBoot() throws {
        
        let configuration = try Config(node: ["sqlite": ["path": "main.sqlite"]])
        
        let sqliteProvider = try Provider(config: configuration)
        let drop = Droplet()
        
        drop.addProvider(sqliteProvider)
        XCTAssertNotNil(drop.database)
        
    }

}

