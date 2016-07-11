# Fluent SQLite 

Adds SQLite support to the Vapor web framework.


```swift
let sqlite = try VaporSQLite.Provider(path: "/path/to/database")

let app = Application(providers: [sqlite])
```
