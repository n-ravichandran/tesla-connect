// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ConnectNetworking",
    platforms: [
        .iOS(.v17),
        .watchOS(.v10),
    ],
    products: [
        .library(
            name: "ConnectNetworking",
            targets: ["ConnectNetworking"]
        ),
    ],
    dependencies: [
        .package(name: "ConnectCore", path: "../ConnectCore"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .target(
            name: "ConnectNetworking",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "ConnectCore", package: "ConnectCore"),
            ]),
        .testTarget(
            name: "ConnectNetworkingTests",
            dependencies: ["ConnectNetworking"]),
    ]
)
