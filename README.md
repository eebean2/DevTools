# DevTools

[![Version](https://img.shields.io/cocoapods/v/DevTools.svg?style=flat)](http://cocoapods.org/pods/DevTools)
[![License](https://img.shields.io/cocoapods/l/DevTools.svg?style=flat)](http://cocoapods.org/pods/DevTools)
[![Platform](https://img.shields.io/cocoapods/p/DevTools.svg?style=flat)](http://cocoapods.org/pods/DevTools)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=AFQ67C767PDPL)

DevTools is a combination of tools, extensions, and code meant to simplify development.

## Core

Core is the base of DevTools, representing some of the most used, underused, complicated or forgotten code. This is to help simplify your projects.

## DTUser

Need to create a user profile, but don't know where to start? Simply start with `DTUser.current`! `DTUser` is a generic user profile tool that allows you to get and set user data! Just call `DTUser.current` to get the current user, `DTUser.generic(username:)` to get a generic `DTUser` object with any username (great for when you don't need a full profile), or `DTUser.unknown` for when you just need a profile, but have no data to set yet!

More customizations coming soon! Soon you can save things like DOB, email address, phone number, and much more! Suggestions? Create a new issue and make a suggestion!

## Toast

Toast is a modified version of the older Toast's diagnostic overlay tool. Although only in its infancy, there's big plans set ahead for this small tool. It aims to give developers who need more than just two lines the ability to modify and adjust the tool in ways they need to efficantly test their apps.

Toast is unique in its ability to be relocated anywhere around the screen and reset to the top left. You can also set the content of Toast to any string you need to help you debug your app.

## Extensions

Extensions are the heart and sole of developers, and with DevTools, we are trying to give you the most used, most useful, and best in one place. From checking if a string is an email, to adding a view to another view and sending it to the back. There is a large list of them and we will only add the ones that are non-intrusive, do not conflict with the system, and benefit everyone!

# Worried about the Apple App Store?

## We have passed 100% of the time

DevTools is based on Apple code, and NOT third party libraries or private libraries. We are non-intrusive to iOS, macOS, tvOS, or watchOS. This means our SDK is not against any of Apple's Developer Guidelines. We cannot guarantee our SDK with Google's Developer Guidelines or Windows Developer Guidelines, nor have we tested our SDK with them (although this IS a goal in the future).

## Other Platforms

We do not guarantee the status, support, or state of our SDK on non-Apple platforms. We wish you all the luck and ask you PLEASE report any bugs!

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

DevTools is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DevTools"
```

## Donate

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=AFQ67C767PDPL)

## Author

eebean2, eebean2@me.com

## License

DevTools is available under the MIT license. See the LICENSE file for more info.
