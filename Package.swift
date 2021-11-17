// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "Swift-Base",
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-collections.git",
                .upToNextMajor(from: "1.0.0") // or `.upToNextMinor
        )
    ],
    targets: [
        .target(
            name: "Swift-Base",
            dependencies: [
                .product(name: "Collections", package: "swift-collections")
            ]
        )
    ]
)
