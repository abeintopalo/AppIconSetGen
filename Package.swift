// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "AppIconSetGen",
    products: [
        .executable(name: "AppIconSetGen", targets: ["AppIconSetGen"]),
        .library(name: "AppIconSetGenCore", targets: ["AppIconSetGenCore"])
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander.git", from: "0.8.0"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "0.9.2"),
    ],
    targets: [
        .target(
            name: "AppIconSetGen",
            dependencies: ["AppIconSetGenCore"]),
        .target(
            name: "AppIconSetGenCore",
            dependencies: ["Commander", "PathKit"]),
    ]
)
