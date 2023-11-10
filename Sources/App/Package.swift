// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "App",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "App",
            targets: ["App"]),
    ],
    dependencies: [
        .package(path: "../Home"),
        .package(path: "../Coordinator"),
        .package(path: "../ProductDetails"),
        .package(path: "../DataLayer")
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Home", package: "Home"),
                .product(name: "Coordinator", package: "Coordinator"),
                .product(name: "ProductDetails", package: "ProductDetails"),
                .product(name: "DataLayer", package: "DataLayer")
            ]
            
        ),
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]),
    ]
)
