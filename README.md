# SQLite Provider for Vapor

Adds SQLite support to the Vapor web framework.


```swift
let sqlite = try VaporSQLite.Provider(database: "/path/to/database")

let app = Application(providers: [sqlite])
```
