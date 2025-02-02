// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Domain",
  products: [
    .library(
      name: "Domain",
      targets: ["Domain"]),
  ],
  targets: [
    .target(
      name: "Domain",
      dependencies: []),
  ])
