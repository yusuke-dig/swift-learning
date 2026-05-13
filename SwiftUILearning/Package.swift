// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftUILearning",
    platforms: [.macOS(.v14)],
    targets: [
        .target(
            name: "SwiftUILearning",
            path: "Sources/SwiftUILearning"
        ),
        .testTarget(
            name: "SwiftUILearningTests",
            dependencies: ["SwiftUILearning"],
            path: "Tests/SwiftUILearningTests"
        ),
    ]
)
