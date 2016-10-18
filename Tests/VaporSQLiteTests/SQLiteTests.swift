import XCTest
@testable import VaporSQLite
import Fluent
import Vapor

import Foundation

class SQLiteTests: XCTestCase {
    static let allTests = [
        ("testAbsolutePath", testAbsolutePath),
        ("testRelativePath", testRelativePath),
        ("testFailingConfig", testFailingConfig)
        ]

    func testProviderBoot(config: Config) throws {

        let sqliteProvider = try Provider(config: config)
        let drop = Droplet()
        drop.addProvider(sqliteProvider)
        XCTAssertNotNil(drop.database)
        sqliteProvider.beforeRun(drop)
        }

    func testAbsolutePath() throws {
        //Creates an absolute path with a writable directory
        let defaultManager = FileManager.default
        let absolutePath = defaultManager.currentDirectoryPath.finished(with: "/absolute.sqlite")
        XCTAssert(absolutePath.hasPrefix("/"))
        
        let absolutePathConfig = try Config(node: ["sqlite": ["path": absolutePath.makeNode()]])
        try testProviderBoot(config: absolutePathConfig)
    }

    func testRelativePath() throws {
        let relativePath = "relative.sqlite"
        let relativePathConfig = try Config(node: ["sqlite": ["path": relativePath.makeNode()]])
        try testProviderBoot(config: relativePathConfig)
    }

    func testFailingConfig() throws {
        //Configs reflecting possible error implemented in the provider
        let noSqliteConfig = try Config(node:["not-sqlite"])
        let noSqlitePathConfig = try Config(node:["sqlite":["not_path":""]])
        let pathNonExistentConfig = try Config(node:["sqlite": ["path": "Database/main.sqlite"]]) //Database folder doesn't exist

        //noSqliteConfig error should be thrown since there is no `sqlite` config file
        XCTAssertThrowsError(try testProviderBoot(config: noSqliteConfig)) { error in
            if let providerError = error as? VaporSQLite.Provider.Error {
                XCTAssert(providerError == VaporSQLite.Provider.Error.noSQLiteConfig)
            }
        }

        //noSqlitePathConfig should be thrown since there is no `path` key provided
        XCTAssertThrowsError(try testProviderBoot(config: noSqlitePathConfig)) { error in
            if let providerError = error as? VaporSQLite.Provider.Error {
                XCTAssert(providerError == VaporSQLite.Provider.Error.pathMissing)
            }
        }

        //driver initialization should fail since the path provided does not exist
        let driverErrorProvider = try Provider(config: pathNonExistentConfig)
        let droplet = Droplet()
        droplet.addProvider(driverErrorProvider)
        XCTAssertNil(droplet.database)
    }
}
