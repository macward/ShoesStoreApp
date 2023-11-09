// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "Services",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Services",
            targets: ["Services"]),
    ],
    dependencies: [
        .package(path: "../StoreNetwork"),
        .package(url: "https://github.com/macward/network-wrapper.git", branch: "main")
    ],
    targets: [
        .target(
            name: "Services",
            dependencies: [
                .product(name: "StoreNetwork", package: "StoreNetwork"),
                .product(name: "NetworkWrapper", package: "network-wrapper")
            ]
        ),
        .testTarget(
            name: "ServicesTests",
            dependencies: ["Services", "StoreNetwork"]),
    ]
)
