// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "ARKids",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "ARKids",
            targets: ["AppModule"],
            bundleIdentifier: "chuy1844441.estrellita-azul",
            teamIdentifier: "M95724D9Z2",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .images),
            accentColor: .presetColor(.pink),
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
                .photoLibrary(purposeString: "Yes"),
                .fileAccess(.pictureFolder, mode: .readWrite),
                .fileAccess(.downloadsFolder, mode: .readWrite),
                .photoLibraryAdd(purposeString: "Unknown Usage Description"),
                .camera(purposeString: "Unknown Usage Description")
            ],
            appCategory: .entertainment
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)