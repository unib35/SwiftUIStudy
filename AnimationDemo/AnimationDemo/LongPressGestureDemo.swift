//
//  longPressGestureDemo.swift
//  AnimationDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct LongPressGestureDemo: View {
    
    let longPress = LongPressGesture()
            .onEnded({ _ in
                print("Long Press")
            })
    
    var body: some View {
        Image(systemName: "hand.point.right.fill")
                    .gesture(longPress)
    }
}

#Preview {
    LongPressGestureDemo()
}
