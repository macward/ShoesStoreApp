// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Application",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Application",
            targets: ["Application"]),
    ],
    dependencies: [
        .package(path: "../Home"),
        .package(path: "../ProductDetails"),
        .package(path: "../ShoppingCart"),
        .package(path: "../ProductAdapters")
    ],
    targets: [
        .target(
            name: "Application",
            dependencies: [
                .product(name: "Home", package: "Home"),
                .product(name: "ProductDetails", package: "ProductDetails"),
                .product(name: "ShoppingCart", package: "ShoppingCart"),
                .product(name: "ProductAdapters", package: "ProductAdapters")

            ]
        ),
        .testTarget(
            name: "ApplicationTests",
            dependencies: ["Application"]),
    ]
)
