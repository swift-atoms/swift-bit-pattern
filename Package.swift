// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-bit-pattern",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Bit Pattern", targets: ["Bit Pattern"]),

        .library(name: "Bit Pattern Foundation Integration", targets: ["Bit Pattern Foundation Integration"]),
        .library(name: "Bit Pattern Test Support", targets: ["Bit Pattern Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-bit.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Bit Pattern",
            dependencies: [
                .product(name: "Bit", package: "swift-bit"),
            ],
            path: "Sources/Bit Pattern"
        ),
        
        .target(
            name: "Bit Pattern Foundation Integration",
            dependencies: [
                .target(name: "Bit Pattern"),
            ],
            path: "Sources/Bit Pattern Foundation Integration"
        ),
        .target(
            name: "Bit Pattern Test Support",
            dependencies: [
                .target(name: "Bit Pattern"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bit Pattern Tests",
            dependencies: [
                .target(name: "Bit Pattern"),
                .target(name: "Bit Pattern Test Support"),
                .target(name: "Bit Pattern Foundation Integration"),
            ],
            path: "Tests/Bit Pattern Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
