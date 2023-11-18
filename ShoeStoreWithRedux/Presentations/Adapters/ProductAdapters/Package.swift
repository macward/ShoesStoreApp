// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProductAdapters",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ProductAdapters",
            targets: ["ProductAdapters"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
    ],
    targets: [
        .target(
            name: "ProductAdapters",
            dependencies: [
                .product(name: "Domain", package: "Domain")
            ]
        ),
        .testTarget(
            name: "ProductAdaptersTests",
            dependencies: ["ProductAdapters"]),
    ]
)
