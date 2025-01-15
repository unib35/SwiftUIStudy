//
//  MagnificationGestureDemo.swift
//  AnimationDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct MagnificationGestureDemo: View {
    let magnification: CGFloat = 0
    
    var body: some View {
        let magnification = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged({ value in
                print("Mangifying Change: \(value)")
            })
            .onEnded { _ in
                print("Magnifying End")
            }
        Image(systemName: "hand.point.right.fill")
            .gesture(magnification)
            
    }
}

#Preview {
    MagnificationGestureDemo()
}
