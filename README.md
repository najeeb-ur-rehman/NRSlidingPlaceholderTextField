# NRSlidingPlaceholderTextField

[![Platform](https://img.shields.io/cocoapods/p/NRSlidingPlaceholderTextField)](https://cocoapods.org/pods/NRSlidingPlaceholderTextField) 
[![Version](https://img.shields.io/cocoapods/v/NRSlidingPlaceholderTextField)](https://cocoapods.org/pods/NRSlidingPlaceholderTextField) 
[![License](https://img.shields.io/cocoapods/l/NRSlidingPlaceholderTextField?color=red)](https://cocoapods.org/pods/NRSlidingPlaceholderTextField)
 <br><br>
 
> ***UITextField subclass with placeholder's horizontal slide animation.***

<br>

## Demo

<img src="https://raw.githubusercontent.com/najeeb-ur-rehman/NRSlidingPlaceholderTextField/master/Demo.gif" title="Demo" >

<br>

## Installation

#### CocoaPods
```ruby
pod 'NRSlidingPlaceholderTextField'
``` 
<br>

## Usage

It can be used just like the same way as UITextField and can even subclassed. It will show exactly the same behaviour as UITextField on the placeholder when setting textField's properties (e.g. textColor, font etc) i.e. if you set the font of textField it will also override the placeholder's font, even for the attributed placeholder.

- **Using Code**<br>

  - Plain Placeholder
  <br>

  ```swift
  let field = NRSlidingPlaceholderTextField()
  field.placeholder = "Plain Placeholder"
  ```

  - Attributed Placeholder 
  <br>

  ```swift
  let attributes: [NSAttributedString.Key: Any] = [
          .font : UIFont.systemFont(ofSize: 12, weight: .medium),
          .foregroundColor : UIColor.white
      ]
  let attributedPlaceholder = NSAttributedString(string: "Attributed",
                                                 attributes: attributes)
  let field = NRSlidingPlaceholderTextField()
  field.attributedPlaceholder = attributedPlaceholder
  ```
- **Using Storyboard**<br>

1. Drag a UITextField into Storyboard.
2. Set class to "NRSlidingPlaceholderTextField".
3. Set the placeholder it will and it will get textColor by default.
4. Create an outlet to customize it

<br>

## Customization

| Parameter | Type | Detail | Default | Limits |
| ------ | ------ | ------ | ------- | ------ |
| sidePadding | CGFloat | It defines the placeholder sides spacing | 7 | >=7  |

<br>

## Licence

NRSlidingPlaceholderTextField is released under the MIT license. See LICENSE for details.
