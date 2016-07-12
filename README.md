# Vapor SQLite 

Adds SQLite support to the Vapor web framework.


## Install

```swift
import Vapor
import VaporSQLite

let sqlite = try VaporSQLite.Provider(path: "/path/to/database.sqlite")

let drop = Droplet(providers: [sqlite])
```

## Raw Queries

```swift
let result = try! sql.driver.raw("SELECT sqlite_version()")
print(result)
```

## Dependencies

### OS X

```shell
brew install sqlite3 libsqlite3-dev
```

### Linux

```shell
sudo apt-get update
sudo apt-get install sqlite3 libsqlite3-dev
```