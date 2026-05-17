// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "UIKitLearning",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "UIKitLearning", targets: ["UIKitLearning"]),
    ],
    targets: [
        .target(
            name: "UIKitLearning",
            path: "Sources/UIKitLearning"
        ),
        .testTarget(
            name: "UIKitLearningTests",
            dependencies: ["UIKitLearning"],
            path: "Tests/UIKitLearningTests"
        ),
    ]
)
