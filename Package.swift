// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "ShortUUID",
    products: [
        .library(
            name: "ShortUUID",
            targets: ["ShortUUID"]),
    ],
    dependencies: [
        .package(name: "AnyBase", url: "https://github.com/jrikhof/any-base-swift", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "ShortUUID",
            dependencies: ["AnyBase"]),
        .testTarget(
            name: "ShortUUIDTests",
            dependencies: ["ShortUUID"]),
    ]
)
