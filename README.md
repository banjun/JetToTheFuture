# JetToTheFuture

[![CI Status](http://img.shields.io/travis/banjun/JetToTheFuture.svg?style=flat)](https://travis-ci.org/banjun/JetToTheFuture)
[![Version](https://img.shields.io/cocoapods/v/JetToTheFuture.svg?style=flat)](http://cocoapods.org/pods/JetToTheFuture)
[![License](https://img.shields.io/cocoapods/l/JetToTheFuture.svg?style=flat)](http://cocoapods.org/pods/JetToTheFuture)
[![Platform](https://img.shields.io/cocoapods/p/JetToTheFuture.svg?style=flat)](http://cocoapods.org/pods/JetToTheFuture)

JetToTheFuture provides safe `forced()` to get to the [BrightFutures](https://github.com/Thomvis/BrightFutures).Future values on the main thread.

Its usecase is mainly for command-line scripts and testcases, not for apps because `forced()` is potentially unsafe on main thread.


## Usage

see [testcases](Example/Tests/Tests.swift).

for command-line swift script:

```swift
let r = forcedFuture {methodThatReturnFuture()}
print("\(r)")
// no need to run RunLoop to wait at the end of the script
```

## Installation

JetToTheFuture is available through [CocoaPods](http://cocoapods.org).

```ruby
pod "JetToTheFuture"
```

## License

JetToTheFuture is available under the MIT license. See the LICENSE file for more info.
