// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

@preconcurrency import PackageDescription

let package = Package(
  name: "TodoShare",
  dependencies: [
    .package(url: "https://github.com/airbnb/swift", from: "1.0.7"),
  ],
  targets: [
  ])
