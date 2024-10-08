// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "MealRandomizerApp",
    platforms: [.iOS(.v14)],
    products: [
        .executable(name: "MealRandomizerApp", targets: ["MealRandomizerApp"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "MealRandomizerApp",
            dependencies: [],
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "MealRandomizerAppTests",
            dependencies: ["MealRandomizerApp"],
            path: "Tests"
        )
    ]
)