// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShoppingCart",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ShoppingCart",
            targets: ["ShoppingCart"]),
    ],
    dependencies: [
        .package(path: "../UISharedElements")
    ],
    targets: [
        .target(
            name: "ShoppingCart",
            dependencies: [
                .product(name: "UISharedElements", package: "UISharedElements")
            ]
        ),
        .testTarget(
            name: "ShoppingCartTests",
            dependencies: ["ShoppingCart"]),
    ]
)
