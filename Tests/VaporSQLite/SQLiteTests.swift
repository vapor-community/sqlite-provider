import XCTest
@testable import VaporSQLite
import Fluent
import Vapor

class SQLiteTests: XCTestCase {
    static let allTests = [
        ("testReality", testReality)
    ]
    
    override func setUp() {
        do {
            try Provider.createTestTable()
        } catch {
            XCTFail("Could not set up : \(error)")
        }
        
    }
    
    func testProviderWithPathInit throws {
        
        let sqliteProvider = try Provider(path: "database.db")
        
        let droplet = Droplet(initializedProviders: [sqliteProvider])
        
        var user = User(name: "Jordy")
        User.database = droplet.database
        try user.save()
        
        let fetched = try User.find(1)
        XCTAssertEqual(user.name, fetched?.name)
    }
}
