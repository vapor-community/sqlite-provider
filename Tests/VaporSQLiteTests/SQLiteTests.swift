import XCTest
@testable import VaporSQLite
import Fluent
import Vapor

class SQLiteTests: XCTestCase {
    static let allTests = [
        ("testProviderWithPathInit", testProviderWithPathInit)
    ]
    
    override func setUp() {
        do {
            try Provider.createTestTable()
        } catch {
            XCTFail("Could not set up : \(error)")
        }
        
    }
    
    
    func testProviderWithPathInit() throws {
        
        let sqliteProvider = try Provider(path: "database.db")
        
        
        
        let drop = Droplet(initializedProviders: [sqliteProvider])
        XCTAssertNotNil(drop.database)
        
        try testBasicFluentOperations(droplet:drop)
    }
    
    func testProviderWithConfigInit() throws {
        
        let configuration = try Config(node: ["sqlite": ["path": "database.db"]])
        
        let sqliteProvider = try Provider(config: configuration)
        let drop = Droplet(initializedProviders:[sqliteProvider])
        XCTAssertNotNil(drop.database)
        
        try testBasicFluentOperations(droplet:drop)
        
    }
    
    func testBasicFluentOperations(droplet:Droplet) throws {
        var user = User(name: "Pablo")
        User.database = droplet.database
        try user.save()
        
        let fetched = try User.find(1)
        XCTAssertEqual(user.name, fetched?.name)
    }
}

