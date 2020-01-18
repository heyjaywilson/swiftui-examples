---
title: How to call a function when a slider changes in SwiftUI
published: false
description: This article is going to explain how to call a function when a slider changes in SwiftUI.
tags: SwiftUI, Swift
---

There are times you might want to call a function when a slider changes in SwiftUI. I did this recently to send out the slider's value to another device when the slider is moving. I couldn't wait to send out the final value since that would be a delayed response for the user.

After the code example, I'll explain the three steps.

```swift
struct SliderExample: View {
// 1. declare a state for the value of the slider
    @State private var sliderValue: Float = 0.0
    
// 2. create a slider with a new Binding variable
    var body: some View {
        Slider(value: Binding(
            get: {
                self.value
            },
            set: {(newValue) in
                  self.value = newVal
                  self.doSomething()
            }
        ))
    }
    
// 3. create the function to call when the slider changes value    
    func doSomething(){
        print("\(value)")
    }
}
```
# 1. Declare a state variable for the value of the slider

This is the variable that the slider is currently. It needs to be declared with a `State` property wrapper since the value is going to change. It also needs to have a `Float` type since a `Slider` needs a `Binding<Float>`.

# 2. Create a slider with a new binding variable

In this step, we are creating a Binding variable. A Binding variable is a computed property. By creating it as the value that the slider is using, we can utilize the `setter` to call the function every time the value is changing.

# 3. Create the function to call when the slider changes value

Make sure to make the function that you need to call when the slider changes values.

---

If you enjoy my posts, please consider subscribing to my [Patreon](https://www.patreon.com/maeganwilson_) and checking out my other posts!

If you don't like having more subscriptions, consider buying me a coffee instead by clicking the image below! <a href="https://www.buymeacoffee.com/appsbymw" target="_blank"><img src="https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>

