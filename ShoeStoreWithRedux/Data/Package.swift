// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(url: "https://github.com/macward/network-wrapper.git", branch: "main"),
        .package(url: "git@github.com:macward/SwiftCommonLibrary.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
                .product(name: "NetworkWrapper", package: "network-wrapper"),
                .product(name: "SwiftCommonLibrary", package: "SwiftCommonLibrary")
            ]
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]),
    ]
)
