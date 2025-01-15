//
//  MagnificationGestureDemo.swift
//  AnimationDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct MagnificationGestureDemo: View {
    let magnification: CGFloat = 0
    @State var magnificationScale: CGFloat = 1
    
    var body: some View {
        let magnification = MagnificationGesture(minimumScaleDelta: 1)
            .onChanged({ value in
                print("Mangifying Change: \(value)")
                self.magnificationScale = value
            })
            .onEnded { _ in
                print("Magnifying End")
            }
        Image(systemName: "hand.point.right.fill")
            .gesture(magnification)
            .scaleEffect(magnificationScale)
            .frame(width:100, height: 90)
            
    }
}

#Preview {
    MagnificationGestureDemo()
}
