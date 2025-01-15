//
//  DragGestureDemo.swift
//  AnimationDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct DragGestureDemo: View {
    @State private var offset: CGSize = .zero
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        withAnimation {
                            self.offset = gesture.translation
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            self.offset = .zero
                        }
                    }
            )
    }
}

#Preview {
    DragGestureDemo()
}
