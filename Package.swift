import PackageDescription

let package = Package(
    name: "JetToTheFuture",
    dependencies: [
        .Package(url: "https://github.com/Thomvis/BrightFutures", majorVersion: 5),
    ],
    exclude: ["Example"])
