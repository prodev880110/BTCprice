<p align="center">
  <img src="https://firebasestorage.googleapis.com/v0/b/bitprice-55d7d.appspot.com/o/GitHub%2FHeader.jpg?alt=media&token=8e7b04c8-a510-4501-96b2-57f4fc6c6098" alt="BitPrice" title="BitPrice">
</p>

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![Build Status][build-badge]][build-url]
[![Codecov][codecov-badge]][codecov-url]
[![Codebeat][codebeat-badge]][codebeat-url]
[![Gitter][gitter-badge]][gitter-url]

BitPrice is an iOS app that display and monitor the current Bitcoint (BTC) rate.

# Requirements

- Xcode 9 or later
- Ruby

# Information

- **Compatibility**: Requires iOS 9.0 or later. Compatible with iPhone and iPod touch.
- **Languages**: English and Portuguese

# Usage

### Required Steps

Run the following commands on the root folder of project:

```
# install system dependencies
gem install bundler
bundle install

# install project dependencies
pod install

# open project
open BitPrice.xcworkspace
```

### Optional Steps

- Install [SwiftLint](https://github.com/realm/SwiftLint#using-homebrew) using [Homebrew](https://brew.sh/)
- Install [fonts](https://firebasestorage.googleapis.com/v0/b/bitprice-55d7d.appspot.com/o/Fonts%2FDINPro.zip?alt=media&token=69fab1f3-2af7-46b1-a29d-81afb5df5297)
- Copy [colors palette](https://firebasestorage.googleapis.com/v0/b/bitprice-55d7d.appspot.com/o/Colors%2FBitPrice.clr?alt=media&token=ea2970e1-ef97-433f-a67a-b202cea28a54) to folder `~\Library\Colors`

# Details

For more details (architecture, environments, tests, tools...) view the [wiki](https://github.com/Bruno-Furtado/bitprice-ios/wiki).

# License

This code is distributed under the terms and conditions of the [MIT](LICENSE).

# Change-log

A brief summary of each Lovely release can be found on the [releases](https://github.com/Bruno-Furtado/bitprice-ios/releases).

[swift-badge]: https://img.shields.io/badge/swift-4.0-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/platform-iOS%209+-lightgrey.svg
[platform-url]: https://developer.apple.com/swift
[build-badge]: https://travis-ci.org/Bruno-Furtado/bitprice-ios.svg?branch=master
[build-url]: https://travis-ci.org/Bruno-Furtado/bitprice-ios
[codecov-badge]: https://codecov.io/gh/Bruno-Furtado/bitprice-ios/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/Bruno-Furtado/bitprice-ios
[gitter-badge]: https://badges.gitter.im/Bruno-Furtado/bitprice-ios.svg
[gitter-url]: https://gitter.im/Bruno-Furtado/bitprice-ios?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge
[codebeat-badge]: https://codebeat.co/badges/47b185ce-c2a6-4101-9abe-ed0e3bdc2293
[codebeat-url]: https://codebeat.co/projects/github-com-bruno-furtado-bitprice-ios-master
