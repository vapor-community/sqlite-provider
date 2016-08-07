import PackageDescription

let package = Package(
    name: "VaporSQLite",
    dependencies: [
   		.Package(url: "https://github.com/vapor/fluent-sqlite.git", majorVersion: 0, minor: 6),
   		.Package(url: "https://github.com/vapor/vapor.git", majorVersion: 0, minor: 16),
    ]
)
