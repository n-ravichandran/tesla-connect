// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConnectKit",
    platforms: [
        .iOS(.v15),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "ConnectKit",
            targets: ["ConnectKit"]),
    ],
    dependencies: [
        .package(name: "ConnectCore", path: "../ConnectCore"),
        .package(name: "ConnectNetworking", path: "../ConnectNetworking"),
    ],
    targets: [
        .target(
            name: "ConnectKit",
            dependencies: [
                .product(name: "ConnectCore", package: "ConnectCore"),
                .product(name: "ConnectNetworking", package: "ConnectNetworking"),
            ]),
        .testTarget(
            name: "ConnectKitTests",
            dependencies: ["ConnectKit"]),
    ]
)
