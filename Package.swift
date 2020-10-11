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
        .library(name: "TicTacToeCommon", targets: ["TicTacToeCommon"]),
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
        .package(url: "https://github.com/AndreiVidrasco/reactiveswift-composable-architecture", .branch("android"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(name: "TicTacToeCommon", dependencies: ["ComposableArchitecture"]),
        .target(name: "LiveAuthenticationClient", dependencies: ["AuthenticationClient", "TicTacToeCommon"]),
        .target(name: "AuthenticationClient", dependencies: ["TicTacToeCommon"]),
        .target(name: "GameCore", dependencies: ["TicTacToeCommon"]),
        .target(name: "NewGameCore", dependencies: ["GameCore", "TicTacToeCommon"]),
        .target(name: "TwoFactorCore", dependencies: ["AuthenticationClient", "TicTacToeCommon"]),
        .target(name: "LoginCore", dependencies: ["TwoFactorCore"]),
        .target(name: "AppCore", dependencies: ["LoginCore", "NewGameCore"]),
    ]
)
