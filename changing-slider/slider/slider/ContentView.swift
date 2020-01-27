//
//  ContentView.swift
//  slider
//
//  Created by Maegan Wilson on 1/26/20.
//  Copyright © 2020 Maegan Wilson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var sliderValue: Float = 0.0
  
    var body: some View {
      Slider(value: Binding(
        get: {
          self.sliderValue
      },
        set: {(newValue) in
          self.sliderValue = newValue
          self.doSomething()
      }
      ))
    }
  
  func doSomething(){
    print("\(sliderValue)")
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
