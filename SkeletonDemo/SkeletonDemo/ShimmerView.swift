//
//  ShimmerView.swift
//  SkeletonDemo
//
//  Created by 이종민 on 3/20/25.
//

import SwiftUI

// Shimmer 애니메이션을 상태 기반으로 변경하는 Modifier
extension View {
    func shimmer(isActive: Bool) -> some View {
        modifier(ShimmerModifier(isActive: isActive))
    }
}

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = -1.0 // 애니메이션 상태

    var isActive: Bool

    func body(content: Content) -> some View {
        content
            .redacted(reason: isActive ? .placeholder : []) // 로딩 중일 때만 redacted 적용
            .overlay(
                GeometryReader { geometry in
                    let width = geometry.size.width

                    LinearGradient(
                        gradient: Gradient(colors: [Color.gray.opacity(0.4), Color.gray.opacity(0.2), Color.gray.opacity(0.4)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(content)
                    .opacity(isActive ? 0.6 : 0)
                    .offset(x: phase * width) // 애니메이션 적용
                    .onAppear {
                        if isActive {
                            withAnimation(
                                Animation.linear(duration: 1.5)
                                    .repeatForever(autoreverses: false)
                            ) {
                                phase = 1.0
                            }
                        }
                    }
                }
            )
    }
}
