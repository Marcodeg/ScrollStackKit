# ScrollStackKit
A performant and easy UI component that allows you to create vertical scrollable layouts.

## Introduction

Scroll Stack Kit is based on UIKit and provides a scrollable stack view, called ScrollStackView.

__ScrollStackView__ is a view that allows you to create vertical scrollable layouts in an easy way, using a combination of [UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview) and [UIStackView](https://developer.apple.com/documentation/uikit/uistackview). Acquiring all the benefits of these two components it uses autolayout to position and size all the rows within itself.

ScrollStackView finds a perfect use when you need to manage a list of __heterogeneous elements in a scrollable layout__, it allows you to avoid the tedious management of recycling views separating the logic of each element. 

## No more massive controllers
With ScrollStackKit you can split the UI into several sections, these sections are called rows, each row can be a
[UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller) or a [UIView](https://developer.apple.com/documentation/uikit/uiview/).

What you'll find is a parent view controller that contains the scroll stack view will be responsible for managing the user interface, managing the child view controllers which in turn will be responsible for managing the ui of a given row.

This means the responsibilities of a controller can be distributed among multiple view controllers allowing you to have a more streamlined architecture.

If a row, or section, is very simple and does not contain any particular logic or responsibility, you can decide to create a simple separate view and not manage it through a child view controller.

__Combining these two approaches will allow your controller to be lightweight and manageable.__

## Installation

## CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate ScrollStackKit into your Xcode project using CocoaPods, specify it in your Podfile:

```
pod 'ScrollStackKit'
```
### Demo
In this repository you can also find a demo.

## License
This software is released under the MIT license. See LICENSE for details.
