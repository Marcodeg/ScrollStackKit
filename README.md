# ScrollStackKit
A performant and easy UI component that allows you to create vertical scrollable layouts.

## Introduction

Scroll Stack Kit is based on UIKit and provides a scrollable stack view, called `ScrollStackView`.

__ScrollStackView__ is a view that allows you to create vertical scrollable layouts in an easy way, using a combination of [UIScrollView](https://developer.apple.com/documentation/uikit/uiscrollview) and [UIStackView](https://developer.apple.com/documentation/uikit/uistackview). Acquiring all the benefits of these two components it uses autolayout to position and size all the rows within itself.

`ScrollStackView` finds a perfect use when you need to manage a list of __heterogeneous elements in a scrollable layout__, it allows you to avoid the tedious management of recycling views separating the logic of each element. 

## No more massive controllers
With ScrollStackKit you can split the UI into several sections, these sections are called rows, each row can be a
[UIViewController](https://developer.apple.com/documentation/uikit/uiviewcontroller) or a [UIView](https://developer.apple.com/documentation/uikit/uiview/).

What you'll find is a parent view controller that contains the scroll stack view will be responsible for managing the user interface, managing the child view controllers which in turn will be responsible for managing the UI of a given row.

<p align="center">
<img src="https://github.com/Marcodeg/ScrollStackKit/blob/master/ParentViewController.jpg?raw=true" alt="drawing" width="150"/>
</p>

This means the responsibilities of a controller can be distributed among multiple view controllers allowing you to have a more streamlined architecture.

If a row, or section, is very simple and does not contain any particular logic or responsibility, you can decide to create a simple separate view and not manage it through a child view controller.

__Combining these two approaches will allow your controller to be lightweight and manageable.__

## Getting Started

### Requirements

* Deployment target iOS 11.0+, tvOS 11.0+
* Swift 4+
* Xcode 10+

### Installation

**CocoaPods**

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate ScrollStackKit into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
pod 'ScrollStackKit'
```

**Importing MagazineLayout**

At the top of the file where you'd like to use ScrollStackView, import ScrollStackKit.

```swift
import ScrollStackKit 
```
Then you need to instantiate a `ScrollStackView`, you can do it placinig it into a xib or by code:

```swift
let scrollStack = ScrollStackView()
```

### Adding a row

`ScrollStackView` provides two methods to insert a row into your vertical layout, they are the same method one for inserting a UIViewController, the other for inserting a UIView.

```swift
func insertRow(_ controller: UIViewController,
               withFixedHeight height: CGFloat? = nil,
               at location: InsertLocation = .bottom,
               spacing: CGFloat? = nil)
```
The methods take as parameters:

* `controller/view`: the controller/view to insert.
* `height`: the height to set at the view if needed.
* `location`: the location for the new row.
* `spacing`: spacing applied after the row.

**Specify a location**

If no location is given for the insertion of a row, it will be inserted as the last one. There are multiple ways to specify the desired location to insert the row.

The location parameter in fact accepts an `InsertLocation` type. It is nothing more than an enum:

```swift
public enum InsertLocation { }
```

The enum take as cases:

* `top`: insert the row at the top.
* `bottom`: insert the row at the bottom.
* `atIndex(Int)`: insert the row at the specified index.
* `after(UIView)`: insert the row after the specified view.
* `before(UIView)`: insert the row after the specified view.
* `afterController(UIViewController)`: insert the row after the specified controller.
* `beforeController(UIViewController)`: insert the row after the specified controller.

### Removing a row
Removing a row is just as easy as adding a row `ScrollStackView` provides the two complementary methods for UIView and UIViewController:

```swift
func removeRow(_ controller: UIViewController)
```

The methods take a single parameter:

* `controller/view`: the controller/view to remove.

### Hiding and Showing a row

If you've ever built a similar layout, you've surely faced the problem of having to show and hide certain components of the UI, based on different use cases.

You can simply hide or show a row using the `isHidden` property that resides in the `UIView`, the `ScrollStackView` will adapt the layout automatically!

```swift
view.isHidden = false
controller.view.isHidden = true
```

## Demo
In this repository you can also find a demo.

## License
This software is released under the MIT license. See LICENSE for details.



