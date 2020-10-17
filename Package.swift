// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TicTacToe",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_14),
        .tvOS(.v12),
        .watchOS(.v5),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "LiveAuthenticationClient", targets: ["LiveAuthenticationClient"]),
        .library(name: "AuthenticationClient", targets: ["AuthenticationClient"]),
        .library(name: "GameCore", targets: ["GameCore"]),
        .library(name: "NewGameCore", targets: ["NewGameCore"]),
        .library(name: "TwoFactorCore", targets: ["TwoFactorCore"]),
        .library(name: "LoginCore", targets: ["LoginCore"]),
        .library(name: "AppCore", targets: ["AppCore"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/AndreiVidrasco/reactiveswift-composable-architecture", .branch("android2"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "LiveAuthenticationClient", dependencies: ["AuthenticationClient", "ComposableArchitecture"]),
        .target(name: "AuthenticationClient", dependencies: ["ComposableArchitecture"]),
        .target(name: "GameCore", dependencies: ["ComposableArchitecture"]),
        .target(name: "NewGameCore", dependencies: ["GameCore", "ComposableArchitecture"]),
        .target(name: "TwoFactorCore", dependencies: ["AuthenticationClient", "ComposableArchitecture"]),
        .target(name: "LoginCore", dependencies: ["TwoFactorCore", "ComposableArchitecture"]),
        .target(name: "AppCore", dependencies: ["LoginCore", "NewGameCore", "ComposableArchitecture"]),
    ]
)
