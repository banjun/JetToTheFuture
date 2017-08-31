// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "JetToTheFuture",
    dependencies: [
        .package(url: "https://github.com/Thomvis/BrightFutures", from: "6.0.0-beta.1")],
    targets: [
        .target(name: "JetToTheFuture",
            dependencies: ["BrightFutures"],
            path: "JetToTheFuture")])
