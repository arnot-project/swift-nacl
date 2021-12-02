// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NaCl",
    platforms: [
        .macOS(.v10_12), .iOS(.v9)
    ],
    products: [
        .library(
            name: "NaCl",
            targets: ["NaCl"]),
    ],
    targets: [
        .target(
            name: "NaCl",
            dependencies: ["NaClC"]),
        .target(
            name: "NaClC",
            resources: [
                .copy("ge25519_base.data")]),
        .testTarget(
            name: "NaClTests",
            dependencies: ["NaCl"])
    ]
)
