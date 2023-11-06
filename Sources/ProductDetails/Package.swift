// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProductDetails",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ProductDetails",
            targets: ["ProductDetails"]),
    ],
    dependencies: [
        .package(path: "../UISharedElements")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ProductDetails",
            dependencies: [
                .product(name: "UISharedElements", package: "UISharedElements")
            ]
        ),
        .testTarget(
            name: "ProductDetailsTests",
            dependencies: ["ProductDetails"]),
    ]
)
