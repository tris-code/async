// swift-tools-version:4.0
/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import PackageDescription

let package = Package(
    name: "Async",
    products: [
        .library(name: "Async", targets: ["Async"]),
        .library(name: "AsyncDispatch", targets: ["AsyncDispatch"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/tris-foundation/platform.git",
            from: "0.4.0"
        ),
        .package(
            url: "https://github.com/tris-foundation/test.git",
            from: "0.4.0"
        )
    ],
    targets: [
        .target(name: "Async", dependencies: ["Platform"]),
        .target(name: "AsyncDispatch", dependencies: ["Async"]),
        .testTarget(
            name: "AsyncDispatchTests",
            dependencies: ["AsyncDispatch", "Test"])
    ]
)
