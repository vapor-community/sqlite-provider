# Vapor SQLite

Adds SQLite support to the Vapor web framework.

## Install

```swift
import Vapor
import VaporSQLite

let drop = Droplet()
try drop.addProvider(VaporSQLite.Provider.self)
```

## Config
Be sure to have a `sqlite.json` config file in your Config directory, the path is set relatively from the Droplet's working directory
```json
{
  "path": "/path/to/database.sqlite"
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
brew install sqlite3
```

### Linux

```shell
sudo apt-get update
sudo apt-get install sqlite3 libsqlite3-dev
```
