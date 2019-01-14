// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Async",
    products: [
        .library(name: "Async", targets: ["Async"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-foundation/platform.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/time.git",
            .branch("master")),
        .package(
            url: "https://github.com/tris-foundation/test.git",
            .branch("master"))
    ],
    targets: [
        .target(name: "Async", dependencies: ["Platform", "Time"]),
        .testTarget(name: "AsyncTests", dependencies: ["Test", "Async"])
    ]
)
