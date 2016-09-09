import PackageDescription

let package = Package(
    name: "VaporSQLite",
    dependencies: [
   		.Package(url: "https://github.com/vapor/sqlite-driver.git", majorVersion: 0, minor: 7),
   		.Package(url: "https://github.com/vapor/vapor.git", majorVersion: 0, minor: 18),
    ]
)
