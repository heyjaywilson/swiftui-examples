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

# 3. Links

# 4. Add 3 `NavigationLink`