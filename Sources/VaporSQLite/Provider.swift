import Vapor
import FluentSQLite

public typealias MySQLDriver = FluentSQLite.SQLiteDriver

public final class Provider: Vapor.Provider {
    public var provided: Providable

    
    public enum Error:Swift.Error {
        case noSQLiteConfig
        case pathMissing
    }
    /**
        MySQL database driver created by the provider.
    */
    public let driver: SQLiteDriver

    /**
        MySQL database created by the provider.
    */
    public let database: Database?

    public init(
        path: String
    ) throws {
        let driver = try SQLiteDriver(path: path)
        let database = Database(driver)

        self.driver = driver
        self.database = database
        
        provided = Providable(database: database)
    }
    
    public convenience init(config: Config) throws {
        guard let sqlite = config["sqlite"]?.object else {
            throw Error.noSQLiteConfig
        }
        
        guard let path = sqlite["path"]?.string else {
            throw Error.pathMissing
        }
        
        try self.init(path: path)
        
    }
    
    public func afterInit(_: Droplet) {
        //
    }
    
    public func beforeRun(_: Droplet) {
        //
    }

}
