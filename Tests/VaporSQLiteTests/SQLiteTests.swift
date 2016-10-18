import XCTest
@testable import VaporSQLite
import Fluent
import Vapor

class SQLiteTests: XCTestCase {
    static let allTests = [
        ("testProviderBoot", testProviderBoot),
        ("testFailingConfig", testFailingConfig)
        ]
    
    func testProviderBoot() throws {
        
        let configuration = try Config(node: ["sqlite": ["path": "main.sqlite"]])
        
        let sqliteProvider = try Provider(config: configuration)
        let drop = Droplet()
        
        drop.addProvider(sqliteProvider)
    
        XCTAssertNotNil(drop.database)
        
        sqliteProvider.beforeRun(drop)
        
    }
    
    func testFailingConfig() throws {
        
        let noSqliteConfig = try Config(node:["not-sqlite"])
        let noSqlitePath = try Config(node:["sqlite":["not_path":""]])
        let pathNonExistent = try Config(node:["sqlite": ["path": "Database/main.sqlite"]]) //Database folder doesn't exist
        
        XCTAssertThrowsError(try Provider(config: noSqliteConfig)) { error in
            if let providerError = error as? VaporSQLite.Provider.Error {
                XCTAssert(providerError == VaporSQLite.Provider.Error.noSQLiteConfig)
            }
        }
        XCTAssertThrowsError(try Provider(config: noSqlitePath)) { error in
            if let providerError = error as? VaporSQLite.Provider.Error {
                XCTAssert(providerError == VaporSQLite.Provider.Error.pathMissing)
            }
        }
        
        let driverEmpty = try Provider(config: pathNonExistent)
        let droplet = Droplet()
        droplet.addProvider(driverEmpty)
        XCTAssertNil(driverEmpty.driver)
    }

}

