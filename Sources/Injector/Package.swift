// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Injector",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Injector",
            targets: ["Injector"]),
    ],
    targets: [
        .target(
            name: "Injector"),
        .testTarget(
            name: "InjectorTests",
            dependencies: ["Injector"]),
    ]
)
