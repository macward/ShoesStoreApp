// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModuleAdapter",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ModuleAdapter",
            targets: ["ModuleAdapter"]),
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "ModuleAdapter",
            dependencies: [
                .product(name: "Domain", package: "Domain")
            ]
        ),
        .testTarget(
            name: "ModuleAdapterTests",
            dependencies: ["ModuleAdapter"]),
    ]
)
