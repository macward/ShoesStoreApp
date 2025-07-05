// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]),
    ],
    dependencies: [
        .package(path: "../Injector")
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "Injector", package: "Injector")
            ]
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"]),
    ]
)
