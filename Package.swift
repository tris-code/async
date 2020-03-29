// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Async",
    products: [
        .library(name: "Async", targets: ["Async"])
    ],
    dependencies: [
        .package(path: "../platform"),
        .package(path: "../time"),
        .package(path: "../test")
    ],
    targets: [
        .target(name: "Async", dependencies: ["Platform", "Time"]),
        .testTarget(name: "AsyncTests", dependencies: ["Test", "Async"])
    ]
)
