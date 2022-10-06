// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EZCodeSDK",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "EZCodeSDK",
            targets: ["EZCodeSDK"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
          url: "https://github.com/kean/Nuke.git",
          .upToNextMajor(from: "9.0.0")
        ),
        .package(
          url: "https://github.com/marcosgriselli/ViewAnimator.git",
          .upToNextMajor(from: "3.0.0")
        ),
        .package(
          url: "https://github.com/airbnb/lottie-ios.git",
          .upToNextMajor(from: "3.0.0")
        ),
        .package(
          url: "https://github.com/ninjaprox/NVActivityIndicatorView.git",
          .upToNextMajor(from: "5.0.0")
        ),
        .package(
          url: "https://github.com/kishikawakatsumi/KeychainAccess.git",
          .upToNextMajor(from: "4.2.2")
        ),
        .package(
          url: "https://github.com/Alamofire/Alamofire.git",
          .upToNextMajor(from: "5.0.0")
        ),
        .package(
          url: "https://github.com/mxcl/PromiseKit",
          .upToNextMajor(from: "6.0.0")
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "EZCodeSDK",
            dependencies: [
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "ViewAnimator", package: "ViewAnimator"),
                .product(name: "NVActivityIndicatorView", package: "NVActivityIndicatorView"),
                .product(name: "KeychainAccess", package: "KeychainAccess"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "PromiseKit", package: "PromiseKit")
            ], path: "Sources/EZCodeSDK", linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS]))
            ]),
        .testTarget(
            name: "EZCodeSDKTests",
            dependencies: ["EZCodeSDK"]),
    ]
)
