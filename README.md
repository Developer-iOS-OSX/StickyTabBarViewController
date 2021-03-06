# StickyTabBarViewController
Sticky and Collapsible View Controller on top of tab bar

![](https://media.giphy.com/media/W519AMUoGGIDx8eHBE/giphy.gif)

## Requirements:
- iOS 10.0
- Tab bar is visible as long as there is a sticky view controller allocated on top of it (any vc pushed at any point should not set ```hidesBottomBarWhenPushed``` to ```true```.

## Installation

StickyTabBarViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StickyTabBarViewController'
```

## Usage

Subclass ```StickyViewControllerSupportingTabBarController``` from your tab bar controller.

Configure animation duration or collapsed view height directly from your tabbar controller:

```swift
import UIKit
import StickyTabBarViewController

class MainTabBarController: StickyViewControllerSupportingTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateCollapsedHeight(to: 50.0)
        updateAnimationDuration(to: 0.5)
    }
}

```
Can also update it any time by accessing to tabBarController.

## Presented View Controller Configurations:

Any view controller to have sticky behaviour must conform to ```Expandable``` and implement a ```minimisedView```.

The implemented ```minimisedView``` should be ideally anchored on top of the view controller's view and its height (either by a direct height constraint or some other constraints) should be equal to the updated value of collapsedHeight ```updateCollapsedHeight(to: 50.0)```. You don't need to worry about hiding or showing it since it is handled by StickyTabBarViewController itself.

```swift
var minimisedView: UIView {
    return UIView() // or return your outlet for minimised view.
}
```

Collapse sticky view from the view controller that conforms to ```Expandable``` as following:

```swift
expander?.collapseCollapsibleViewController()
```

Remove sticky view from the view controller that conforms to ```Expandable``` as following:

```swift
expander?.removeCollapsibleViewController(animated:)
```
Configure a ViewController in collapsed state as following

```swift
if let tabBarController = tabBarController as? StickyViewControllerSupportingTabBarController {
    let viewControllerToStick = SampleChildViewController() // example VC
    tabController?.configureCollapsedTrainingView(withChildViewController: viewControllerToStick)
}
```

## Pending Improvements:
- It would be nice to have the ability to hide tab bar and status bar upon expanding, in parameterized way.
- Better support for UINavigationController (maybe not expand as high as behind the status bar)
- Right now it is not possible to configure or overwrite the implented sticky VC, one must first remove it and then implement another if needed. Maybe implement overwriting if configure is called while there is already a view controller allocated?
