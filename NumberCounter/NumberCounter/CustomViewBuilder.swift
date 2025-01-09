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

// 커스텀 레이블 스타일 (레이아웃)
struct HorizontalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            configuration.icon
                .padding(5)
            configuration.title
        }
    }
}

struct CustomViewBuilder: View {
    var body: some View {
        MyVStack{
            Text("Custom VStack")
            Label("Custom Label", systemImage: "star.fill")
                .labelStyle(HorizontalLabelStyle())
        }
    }
}

#Preview {
    CustomViewBuilder()
}
