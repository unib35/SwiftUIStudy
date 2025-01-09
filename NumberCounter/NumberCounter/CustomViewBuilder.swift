//
//  ContentView2.swift
//  NumberCounter
//
//  Created by 이종민 on 1/9/25.
//

import SwiftUI

struct MyVStack<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content){
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10){
            content()
        }
        .font(.largeTitle)
    }
}

struct CustomViewBuilder: View {
    var body: some View {
        MyVStack{
            Text("Custom VStack")
        }
    }
}

#Preview {
    CustomViewBuilder()
}
