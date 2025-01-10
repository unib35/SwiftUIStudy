//
//  ContentView.swift
//  ColorPicker
//
//  Created by 이종민 on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colorNames: [String] = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        VStack {
            Spacer()
            Text(text)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 1), value: rotation)
                .foregroundStyle(colors[colorIndex])
            
            Spacer()
            Divider()
            
            Slider(value: $rotation, in: 0 ... 360, step: 0.1)
                .padding()
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach (0 ..< colorNames.count) { color in
                    Text(colorNames[color])
                        .foregroundStyle(colors[color])
                }
            }
            .pickerStyle(.wheel)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
