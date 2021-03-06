// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "SwiftWasmPad",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "SwiftWasmPad", targets: ["SwiftWasmPad"]),
    ],
    dependencies: [
        .package(name: "JavaScriptKit", url: "https://github.com/swiftwasm/JavaScriptKit", .exact("0.5.0")),
        .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", .upToNextMinor(from: "0.3.0")),
        .package(name: "ChibiLink", url: "https://github.com/kateinoigakukun/chibi-link", .exact("1.0.0")),
    ],
    targets: [
        .target(
            name: "SwiftWasmPad",
            dependencies: [
                .target(name: "i64_polyfill"),
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                .product(name: "TokamakShim", package: "Tokamak"),
                .product(name: "ChibiLink", package: "ChibiLink"),
            ]),
        .target(name: "i64_polyfill"),
    ]
)
