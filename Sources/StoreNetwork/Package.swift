// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StoreNetwork",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "StoreNetwork",
            targets: ["StoreNetwork"]),
    ],
    targets: [
        .target(
            name: "StoreNetwork"),
        .testTarget(
            name: "StoreNetworkTests",
            dependencies: ["StoreNetwork"]),
    ]
)
