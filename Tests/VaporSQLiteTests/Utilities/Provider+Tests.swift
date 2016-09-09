import VaporSQLite
import FluentSQLite

extension Provider {
    static func createTestTable() throws {
        let driver = try SQLiteDriver(path:"database.db")
        try _ = driver.raw("DROP TABLE IF EXISTS `users`")
        try _ = driver.raw("CREATE TABLE `users` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT)")
    }
}
