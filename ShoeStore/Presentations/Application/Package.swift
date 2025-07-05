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
        .package(path: "../Checkout"),
        .package(path: "../ModuleAdapter"),
        .package(path: "../Data")
    ],
    targets: [
        .target(
            name: "Application",
            dependencies: [
                .product(name: "Home", package: "Home"),
                .product(name: "ProductDetails", package: "ProductDetails"),
                .product(name: "ShoppingCart", package: "ShoppingCart"),
                .product(name: "ModuleAdapter", package: "ModuleAdapter"),
                .product(name: "Checkout", package: "Checkout"),
                .product(name: "Data", package: "Data")

            ]
        ),
        .testTarget(
            name: "ApplicationTests",
            dependencies: ["Application"]),
    ]
)
