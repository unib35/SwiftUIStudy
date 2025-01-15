//
//  DoubleTapGesture.swift
//  AnimationDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct DoubleTapGestureDemo: View {
    let doubleTap = TapGesture(count: 2)
        .onEnded ({ _ in
            print("Double Tap!!")
        })
    var body: some View {
        Image(systemName: "hand.point.right.fill")
            .gesture(doubleTap)
    }
}

#Preview {
    DoubleTapGestureDemo()
}
