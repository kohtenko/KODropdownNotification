# KODropdownNotification

[![CI Status](http://img.shields.io/travis/Kokhtenko, Oleg/KODropdownNotification.svg?style=flat)](https://travis-ci.org/Kokhtenko, Oleg/KODropdownNotification)
[![Version](https://img.shields.io/cocoapods/v/KODropdownNotification.svg?style=flat)](http://cocoadocs.org/docsets/KODropdownNotification)
[![License](https://img.shields.io/cocoapods/l/KODropdownNotification.svg?style=flat)](http://cocoadocs.org/docsets/KODropdownNotification)
[![Platform](https://img.shields.io/cocoapods/p/KODropdownNotification.svg?style=flat)](http://cocoadocs.org/docsets/KODropdownNotification)

Popup UIView for iPhone/iPad in both orientations with nice effect. 

![Output sample](https://raw.github.com/kohtenko/KODropdownNotification/master/anamitionExample.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

- Create instance with static method `[KODropdownNotification popupView]`;
- Add your custom view to `popupInstance.handleView` as subview;
- In your ViewController override method `willAnimateRotationToInterfaceOrientation:duration:` and call `[popupInstance willRotateToOrientation:toInterfaceOrientation withDuration:duration];`;
- Call methods `[popupInstance show];` and `[popupInstance hideAnimated:]` to show or hide your popup!


## Requirements

## Installation

KODropdownNotification is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "KODropdownNotification"

## Author

Kokhtenko, Oleg, kohtenko@gmail.com

## License

KODropdownNotification is available under the MIT license. See the LICENSE file for more info.

