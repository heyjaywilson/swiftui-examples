//
//  ContentView.swift
//  NavigationExample
//
//  Created by Maegan Wilson on 11/8/19.
//  Copyright © 2019 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedView: Int? = 1
    
    var body: some View {
        NavigationView{
            List(1 ..< 5) { item in
                NavigationLink(destination: Text("Destination \(item)"), tag: item, selection: self.$selectedView) {
                    Text("Navigation Link \(item)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
