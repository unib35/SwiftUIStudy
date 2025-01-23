//
//  ContentView.swift
//  UIViewDemo
//
//  Created by 이종민 on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MyScrollView(text: "Hello MyScrollView")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
