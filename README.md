# Vapor SQLite

Adds SQLite support to the Vapor web framework.

## Install

```swift
import Vapor
import VaporSQLite

let drop = Droplet(preparations:[User.self], providers:[VaporSQLite.Provider.self])
```

## Config
Be sure to have a `sqlite.json` config file in your Config directory, you need to make sure an absolute path is set if run from Xcode
```json
{
  "path": "/absolute/path/to/database.sqlite"
}
```


## Raw Queries

```swift
let result = try drop.database?.driver.raw("SELECT sqlite_version()")
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
