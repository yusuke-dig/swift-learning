// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftLearning",
    targets: [
        .target(
            name: "SwiftLearning",
            path: "Sources/SwiftLearning"
        ),
        .testTarget(
            name: "SwiftLearningTests",
            dependencies: ["SwiftLearning"],
            path: "Tests/SwiftLearningTests"
        ),
    ]
)
