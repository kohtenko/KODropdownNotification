# KODropdownNotification
[![Version](https://img.shields.io/cocoapods/v/KODropdownNotification.svg?style=flat)](http://cocoadocs.org/docsets/KODropdownNotification)
[![License](https://img.shields.io/cocoapods/l/KODropdownNotification.svg?style=flat)](http://cocoadocs.org/docsets/KODropdownNotification)
[![Platform](https://img.shields.io/cocoapods/p/KODropdownNotification.svg?style=flat)](http://cocoadocs.org/docsets/KODropdownNotification)

Fully customizable notification view for iOS.

Uses Autolayout 

![Output sample](https://raw.github.com/kohtenko/KODropdownNotification/master/anamitionExample.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

- Create your own subclass of `KODropdownNotification`;
- Create your own XIB file with your class in it;
- Create instance of your class using `initWithNibName:` initializer
- Customize look and feel of your notification using:
  - `notificationHeight` (setup from XIB by default)
  - `dismissOnSwipe` to allow user swipe it up as system notification
- You can override `delegate` property in your subclass and call any actions you need (Buttons, Gestures, etc.);
- Use `showAnimated:` and `dismissAnimated` to show or hide your notification;


## Requirements

## Installation

KODropdownNotification is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    `pod "KODropdownNotification"`

## Author

Kokhtenko, Oleg, kohtenko@gmail.com

## License

KODropdownNotification is available under the MIT license. See the LICENSE file for more info.

