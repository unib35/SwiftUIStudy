//
//  ContentView.swift
//  ProgressViewDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 30.0
    
    var body: some View {
        VStack {
            ProgressView("Task Progress", value: progress, total: 100)
                .progressViewStyle(LinearProgressViewStyle())
            
            ProgressView("Task Progress", value: progress, total: 100)
            //MacOS에서만 이용가능
                .progressViewStyle(CircularProgressViewStyle())
            
            ProgressView("Task Progress", value: progress, total: 100)
                .progressViewStyle(ShadowProgressViewStyle())
            
            ProgressView("Working...")
            Slider(value: $progress, in: 1...100, step: 0.1)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(.red)
            .shadow(color: Color(red: 0, green: 0.7, blue: 0), radius: 5.0, x: 2.0, y: 2.0)
            .progressViewStyle(LinearProgressViewStyle())
    }
}
