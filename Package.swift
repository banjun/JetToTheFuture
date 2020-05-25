// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "JetToTheFuture",
    dependencies: [
        .package(url: "https://github.com/Thomvis/BrightFutures", from: "8.0.0"),
        .package(url: "https://github.com/Quick/Quick", from: "2.2.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "8.0.0"),
    ],
    targets: [
        .target(
            name: "JetToTheFuture",
            dependencies: ["BrightFutures"],
            path: "JetToTheFuture"),
        .testTarget(
            name: "JetToTheFutureTest",
            dependencies: ["JetToTheFuture", "BrightFutures", "Quick", "Nimble"],
            path: "Example/Tests"),
    ]
)
