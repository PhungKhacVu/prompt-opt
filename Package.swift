// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BakingAnalyzer",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "BakingAnalyzer",
            targets: ["BakingAnalyzer"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.8.0")),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", .upToNextMajor(from: "5.18.0")),
        .package(url: "https://github.com/airbnb/lottie-ios.git", .upToNextMajor(from: "4.3.0")),
        .package(url: "https://github.com/danielgindi/Charts.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", .upToNextMajor(from: "5.0.1")),
    ],
    targets: [
        .target(
            name: "BakingAnalyzer",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "SDWebImage", package: "SDWebImage"),
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "Charts", package: "Charts"),
                .product(name: "SwiftyJSON", package: "SwiftyJSON"),
            ],
            path: "BakingAnalyzer"
        ),
        .testTarget(
            name: "BakingAnalyzerTests",
            dependencies: ["BakingAnalyzer"],
            path: "BakingAnalyzerTests"
        ),
    ]
)
