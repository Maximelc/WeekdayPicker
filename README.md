# WeekdayPicker

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/WeekdayPicker.svg)](https://img.shields.io/cocoapods/v/WeekdayPicker.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg?style=flat)](https://maximelc.github.io/WeekdayPicker)

WeekdayPicker is a custom UIDatePicker with weekdays.

<img src="https://raw.githubusercontent.com/Maximelc/WeekdayPicker/master/Assets/DemoExample.png" alt="Demo example" width="270" height="464">

- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Usage](#usage)
- [Documentation](#documentation)
- [License](#license)

## Requirements

- iOS 9.0+
- Xcode 9+
- Swift 4.0+

## Communication

- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/WeekdayPicker).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

You can choose one of theses options to install WeekdayPicker.

<details>
<summary>📦 CocoaPods — CocoaPods is a library dependencies for Xcode projects.</summary>
[CocoaPods Installation](https://guides.cocoapods.org/using/getting-started.html#getting-started)

To integrate WeekdayPicker into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'WeekdayPicker', '~> 0.1'
end
```

Then, run the following command:

```bash
$ pod install
```
</details>

<details>
<summary>💉 Carthage — Carthage is a decentralized dependency manager for Cocoa.</summary>
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate WeekdayPicker into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "WeekdayPicker/WeekdayPicker" ~> 4.7
```

Run `carthage update` to build the framework and drag the built `WeekdayPicker.framework` into your Xcode project.
</details>

<details>
<summary>📚 Swift Package Manager — Package manager for the Swift.</summary>

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but WeekdayPicker does support its use on supported platforms.

Once you have your Swift package set up, adding WeekdayPicker as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/Maximelc/WeekdayPicker.git", from: "1.0.0")
]
```
</details>

### Manually

If you prefer to not use any of the dependency managers, you can integrate WeekdayPicker into your project manually.

### Usage

After adding the framework to your project, import the module.
```swift
import WeekdayPicker
```

Add WeekdayPicker programmatically 🤓
```swift
// Initialization
let myPicker: WeekdayPicker = WeekdayPicker()

// Add delegation conformance
myPicker.delegated = self

// Apply frame
myPicker.frame = CGRect(origin: CGPoint(x: 0, y: 150),
                        size: CGSize(width: self.view.frame.size.width,
                                     height: 150))        

// The first date to show will be the current date
myPicker.setToDate(Date())

// Add picker to current view
self.view.addSubview(myPicker)
```

Implement WeekdayPickerDelegate 🤝
```swift
// MARK: - WeekdayPickerDelegate
extension <#MyViewController#>: WeekdayPickerDelegate {

    func weekdayPickerDateChanged(_ date: Date?) {
        if let changedDate = date {
            print("\(changedDate)")
        }
    }
}
```

### Documentation
The full documentation is available [here](https://maximelc.github.io/WeekdayPicker).

### License

WeekdayPicker is released under the MIT license. [See LICENSE](https://github.com/Maximelc/WeekdayPicker/blob/master/LICENSE) for details.
