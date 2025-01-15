//
//  TapGestureDemo.swift
//  AnimationDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct TapGestureDemo: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Circle()
            .fill(Color.cyan)
            .frame(width: 100, height: 100)
            .scaleEffect(scale)
            .animation(
                .timingCurve(0.68, -0.6, 0.32, 1.6)
                .delay(0.2)
                .repeatCount(3, autoreverses: true),
                value: scale
            )
            .onTapGesture {
                scale = scale < 1.5 ? 2 : 1
            }
    }
}

#Preview {
    TapGestureDemo()
}
