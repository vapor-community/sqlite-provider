# Vapor SQLite 

Adds SQLite support to the Vapor web framework.

## Install

```swift
import Vapor
import VaporSQLite

let drop = Droplet(preparations:[User.self], providers:[VaporSQLite.Provider.self])
```

## Config
Be sure to have a `sqlite.json` config file in your Config directory
```json
{
  "path": "Database/main.sqlite"
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
