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
        .library(name: "Bit Finite Test Support", targets: ["Bit Finite Test Support"]),

        .library(name: "Bit Pattern", targets: ["Bit Pattern"]),

        .library(name: "Bit Pattern Foundation Integration", targets: ["Bit Pattern Foundation Integration"]),
        .library(name: "Bit Pattern Test Support", targets: ["Bit Pattern Test Support"]),
    ],
    traits: [
        .trait(name: "Finite", description: "Finite integration"),

    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),

        .package(url: "https://github.com/swift-atoms/swift-ordinal.git", branch: "main"),

        .package(url: "https://github.com/swift-atoms/swift-index.git", branch: "main"),

        .package(url: "https://github.com/swift-atoms/swift-cardinal.git", branch: "main"),

        .package(url: "https://github.com/swift-atoms/swift-finite.git", branch: "main"),

        .package(
            url: "https://github.com/swift-atoms/swift-bit.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(name: "Bit Finite Test Support", dependencies: [.target(name: "Bit Pattern")], path: "Tests/Decision Bit Finite Support"),

        .testTarget(name: "Bit Pattern Finite Integration Tests", dependencies: [.target(name: "Bit Pattern")], path: "Tests/Decision Bit Finite Tests"),

        .target(
            name: "Bit Pattern",
            dependencies: [
                .product(name: "Tagged", package: "swift-tagged", condition: .when(traits: ["Finite"])),

                .product(name: "Ordinal", package: "swift-ordinal", condition: .when(traits: ["Finite"])),

                .product(name: "Index", package: "swift-index", condition: .when(traits: ["Finite"])),

                .product(name: "Cardinal", package: "swift-cardinal", condition: .when(traits: ["Finite"])),

                .product(name: "Finite", package: "swift-finite", condition: .when(traits: ["Finite"])),

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

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
