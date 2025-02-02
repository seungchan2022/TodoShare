// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Architecture",
  products: [
    .library(
      name: "Architecture",
      targets: ["Architecture"]),
  ],
  targets: [
    .target(
      name: "Architecture",
      dependencies: []),
  ])
