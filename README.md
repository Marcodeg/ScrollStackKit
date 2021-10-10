# ScrollStackKit
A performant and easy UI component that allows you to create vertical scrollable layouts.

## Introduction

Scroll Stack Kit provides a scrollable stack view, called ScrollStackView

ScrollStackView is a view that allows you to create vertical scrollable layouts in an easy way, using a combination of `UISrollView` and `UIStackView`. 

ScrollStackView finds a perfect use when you need to manage a list of __heterogeneous elements in a scrollable layout__, it allows you to avoid the tedious management of recycling views and to separate the logic of each element. 

Each element within the ScrollStackView is considered as a row, each row can be a UIViewController or a UIView.
