import Vapor
import FluentSQLite

public typealias MySQLDriver = FluentSQLite.SQLiteDriver

public final class Provider: Vapor.Provider {

    
    public enum Error:Swift.Error {
        case noSQLiteConfig
        case pathMissing
    }
    
    private let path:String
    
    public init(config: Config) throws {
        guard let sqlite = config["sqlite"]?.object else {
            throw Error.noSQLiteConfig
        }
        
        guard let path = sqlite["path"]?.string else {
            throw Error.pathMissing
        }
        
        self.path = path
        
    }
    
    public func boot(_ drop: Droplet) {
        
        guard let driver = try? SQLiteDriver(path: drop.workDir+self.path) else {
            return
        }
                
        let database = Database(driver)
        drop.database = database
    }
    
    public func afterInit(_: Droplet) {
        //
    }
    
    public func beforeRun(_: Droplet) {
        //
    }


}
