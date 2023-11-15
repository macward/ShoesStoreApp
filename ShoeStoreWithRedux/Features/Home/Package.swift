// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Home",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]),
    ],
    dependencies: [
        .package(path: "../UISharedElements"),
        .package(path: "../ProductAdapters")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                .product(name: "UISharedElements", package: "UISharedElements"),
                .product(name: "ProductAdapters", package: "ProductAdapters")
            ]
        ),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]),
    ]
)
