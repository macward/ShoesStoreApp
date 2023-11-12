// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UISharedElements",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "UISharedElements",
            targets: ["UISharedElements"]),
    ],
    dependencies: [
        .package(url: "https://github.com/macward/SwiftCommonLibrary.git", branch: "main"),
        .package(path: "../DataLayer"),
    ],
    targets: [
        .target(
            name: "UISharedElements",
            dependencies: [
                .product(name: "SwiftCommonLibrary", package: "SwiftCommonLibrary"),
                .product(name: "DataLayer", package: "DataLayer")
            ]
        ),
        .testTarget(
            name: "UISharedElementsTests",
            dependencies: ["UISharedElements"]),
    ]
)
