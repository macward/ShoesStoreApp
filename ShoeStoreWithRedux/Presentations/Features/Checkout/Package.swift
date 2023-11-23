// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Checkout",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Checkout",
            targets: ["Checkout"]),
    ],
    dependencies: [
        .package(path: "../UISharedElements"),
        .package(path: "../ModuleAdapter"),
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Checkout",
            dependencies: [
                .product(name: "UISharedElements", package: "UISharedElements"),
                .product(name: "ModuleAdapter", package: "ModuleAdapter"),
                .product(name: "Domain", package: "Domain")
            ]
        ),
        .testTarget(
            name: "CheckoutTests",
            dependencies: ["Checkout"]),
    ]
)
