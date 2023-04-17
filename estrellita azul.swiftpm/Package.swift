// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "estrellita azul",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "estrellita azul",
            targets: ["AppModule"],
            bundleIdentifier: "chuy1844441.estrellita-azul",
            teamIdentifier: "M95724D9Z2",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .paper),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .camera(purposeString: "Unknown Usage Description")
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)