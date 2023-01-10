// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ToggleGroup",
    platforms: [.iOS(SupportedPlatform.IOSVersion.v15),],
    
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ToggleGroup",
            targets: ["ToggleGroup"]),
    ],
    
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/roger-vogel/Extensions.git", from: "1.0.0"),
    ],
    
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ToggleGroup",
            dependencies: [.product(name: "Extensions", package: "Extensions"),]),
        .testTarget(
            name: "ToggleGroupTests",
            dependencies: ["ToggleGroup"]),
    ]
)

/*
 import PackageDescription

 let package = Package(
     name: "KeychainManager",
     products: [
         // Products define the executables and libraries a package produces, and make them visible to other packages.
         .library(
             name: "KeychainManager",
             targets: ["KeychainManager"]),
     ],
     dependencies: [
         // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/jrendel/SwiftKeychainWrapper.git", from: "4.0.1"),
     ],
     targets: [
         // Targets are the basic building blocks of a package. A target can define a module or a test suite.
         // Targets can depend on other targets in this package, and on products in packages this package depends on.
         .target(
             name: "KeychainManager",
             dependencies: [.product(name: "SwiftKeychainWrapper", package: "SwiftKeychainWrapper"),]),
         .testTarget(
             name: "KeychainManagerTests",
             dependencies: ["KeychainManager"]),
     ]
 )

 */
