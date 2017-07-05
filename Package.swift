// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "AppIconSetGen",
    targets: [
        Target(name: "AppIconSetGenCore"),
        Target(name: "AppIconSetGen", dependencies: ["AppIconSetGenCore"]),
    ],
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0),
        .Package(url: "https://github.com/kylef/PathKit.git", majorVersion: 0),
    ]
)
