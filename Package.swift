import PackageDescription

let package = Package(
    name: "VaporSQLite",
    dependencies: [
   		.Package(url: "https://github.com/vapor/sqlite-driver.git", majorVersion: 1),
   		.Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor:1),
    ]
)
