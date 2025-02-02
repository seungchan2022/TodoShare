// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Platform",
  products: [
    .library(
      name: "Platform",
      targets: ["Platform"]),
  ],
  targets: [
    .target(
      name: "Platform",
      dependencies: []),
  ])
