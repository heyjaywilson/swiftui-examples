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

We need to embed the `Text` in a `List` and then the `List` `NavigationView`. That should look like the code sample below.

```swift
struct ContentView: View {
    var body: some View {
        List(0 ..< 5) { item in
            Text("Hello, World!")
        }
    }
}
```

# 3. Add 3 `NavigationLink`