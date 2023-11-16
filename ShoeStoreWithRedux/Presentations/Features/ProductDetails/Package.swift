// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProductDetails",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ProductDetails",
            targets: ["ProductDetails"]),
    ],
    dependencies: [
        .package(path: "../UISharedElements"),
        .package(path: "../ProductAdapters")
    ],
    targets: [
        .target(
            name: "ProductDetails",
            dependencies: [
                .product(name: "UISharedElements", package: "UISharedElements"),
                .product(name: "ProductAdapters", package: "ProductAdapters")
            ]
        ),
        .testTarget(
            name: "ProductDetailsTests",
            dependencies: ["ProductDetails"]),
    ]
)
