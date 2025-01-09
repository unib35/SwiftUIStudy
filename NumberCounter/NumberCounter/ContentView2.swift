//
//  ContentView2.swift
//  NumberCounter
//
//  Created by 이종민 on 1/9/25.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        Text("Hello World")
            .font(.largeTitle)
            .border(Color.black)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.blue)
    }
}

#Preview {
    ContentView2()
}
