//
//  EasyInOutDemo.swift
//  AnimationDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct EaseInOutDemo: View {
    @State private var isTextVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isTextVisible.toggle()
                }
            },
                   label: {
                Text("Toggle Text")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .clipShape(.rect(cornerRadius: 10))
            })
            
            if isTextVisible {
                Text("Hello SwiftUI Animation!")
                    .font(.largeTitle)
                    .padding()
//                    .transition(.opacity)
//                    .transition(.scale)
//                    .transition(.slide)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

#Preview {
    EaseInOutDemo()
}
