---
title: Default a View in NavigationView with SwiftUI
published: false
description: A guide to default a View in NavigationView with SwiftUI
tags: swift, swiftui
canonical_url: https://blog.appsbymw.com/posts/
---

# Default a View in NavigationView with SwiftUI

I'm going to walk through the steps to create a default view in a `NavigationView` in a brand new project.

# 1. Create a Single View App

Create a new XCode project using SwiftUI.

# 2. In `ContentView.swift`, add a `NavigationView`

A fresh `ContentView.swift` looks like this:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

In order to add a NavigationView that looks like a list, we first need to embed the Text in a list. This can be done by `CMD + Click` on `Text` and choosing Embed in List from the menu. 

![GIF Showing the `CMD + Click`](https://github.com/maeganjwilson/swiftui-examples/blob/master/NavigationExample/post-resources/embed-list.gif?raw=true)

You should then get the code sample below.

```swift
struct ContentView: View {
    var body: some View {
        List(0 ..< 5) { item in
            Text("Hello, World!")
        }
    }
}
```

Now, put the list inside the `NavigationView`. `ContentView` should now have the following code:

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(0 ..< 5) { item in
                Text("Hello, World!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

If using the Live Preview in Xcode, then the preview should look like the picture below.

![NavigationView of Hello World!](https://github.com/maeganjwilson/swiftui-examples/blob/master/NavigationExample/post-resources/NavigationView-1.png?raw=true)

Let's also make the list look different on each row. Change the string in the text to say "Navigation Link \(item)" and make the list range 1 to 5 instead of 0 to 5.

This is what the code should look like.

```swift
List(1 ..< 5) { item in
    Text("Navigation Link \(item)")
}
```

Here is what the preview will look like

![NavigationView changed with the above changes](https://github.com/maeganjwilson/swiftui-examples/blob/master/NavigationExample/post-resources/NavigationView-2.png?raw=true)

# 3. Add a `NavigationLink`

The `Text` needs to be inside a `NavigationLink` in order to navigate to a different view. We will use `NavigationLink(destination: Destination, tag: Hashable, selection: Binding<Hashable?>, label: () -> Label)`.

Let's break this down a bit before implementing it.

- `destination`: the `View` to present when the link is selected
- `tag`: a value that is of type `Hashable` to distinguish between which link is selected
    - To read more about Hashable [click here](https://developer.apple.com/documentation/swift/hashable). The link will take you to Apple's documentation about Hashable.
- `selection`: a variable that is an optional `Hashable` type that will change values to the tag
- `label`: a closure that returns a `View` which is what the user will see and be able to click on.

Now that all the parts are explained, let's actually implement the `NavigationLink`.

```swift
List(1 ..< 5) { item in
    NavigationLink(destination: Text("Destination \(item)"), tag: item, selection: self.$selectedView) {
        Text("Navigation Link \(item)")
    }
}
```

Once it's implemented, you should get an error that says `Use of unresolved identifier '$selectedView'`. This error is expected since we do not have a Binding variable called `selectedView` in our code. Let's add it to the `ContentView` struct.

Place `@State private var selectedView: Int? = 0` before declaring `body`. The error should go away now. When declaring `selectedView` they type needs to be an optional since `NavigationLink` wants an optional Hashable type.

As of right now, running the app, it will look like no default view is given. This is because there is no `NavigationLink` with a tag of 0.

![no default](https://github.com/maeganjwilson/swiftui-examples/blob/master/NavigationExample/post-resources/Simulator-1.png?raw=true)

If you change the initial value of `selectedView` to 1, then it will open to the destination of `NavigationLink` that has a tag of 1.

![GIF of opening a default view](https://github.com/maeganjwilson/swiftui-examples/blob/master/NavigationExample/post-resources/Simulator-2.png?raw=true)

# FINISHED

Now the basic tutorial is finished of how to achieve this, but I'm going to continue in the next section on how to improve the UX because on iOS this is not great behavior, but on iPadOS when in landscape, this behavior is great!