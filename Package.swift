import PackageDescription

let package = Package(
    name: "VaporSQLite",
    dependencies: [
   		.Package(url: "https://github.com/qutheory/fluent-sqlite.git", majorVersion: 0, minor: 6),
   		.Package(url: "https://github.com/qutheory/vapor.git", majorVersion: 0, minor: 13),
    ]
)
