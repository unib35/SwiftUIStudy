//
//  ContentView.swift
//  SkeletonDemo
//
//  Created by 이종민 on 3/20/25.
//

import SwiftUI

// 기본 스켈레톤 효과를 위한 수정자
struct SkeletonModifier: ViewModifier {
    let isLoading: Bool
    let animation: Animation
    
    init(isLoading: Bool, animation: Animation = Animation.linear(duration: 1.5).repeatForever(autoreverses: true)) {
        self.isLoading = isLoading
        self.animation = animation
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                ZStack {
                    if isLoading {
                        GeometryReader { geometry in
                            Rectangle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.gray.opacity(0.2), .gray.opacity(0.5), .gray.opacity(0.2)]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: geometry.size.width * 2)
                                .position(x: -geometry.size.width / 2, y: geometry.size.height / 2)
                                .animation(animation, value: isLoading)
                        }
                    }
                }
            )
            .disabled(isLoading)
    }
}

// 사용하기 쉽게 View extension으로 추가
extension View {
    func skeleton(isLoading: Bool, animation: Animation = Animation.linear(duration: 1.5).repeatForever(autoreverses: true)) -> some View {
        modifier(SkeletonModifier(isLoading: isLoading, animation: animation))
    }
}

// 샘플 사용 예제
struct ContentView: View {
    @State private var isLoading = true
    
    var body: some View {
        VStack(spacing: 20) {
            // 스켈레톤 텍스트 예제
            Text(isLoading ? "" : "안녕하세요")
                .frame(height: 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(isLoading ? Color.gray.opacity(0.3) : Color.clear)
                .cornerRadius(4)
                .skeleton(isLoading: isLoading)
            
            // 스켈레톤 이미지 예제
            Rectangle()
                .fill(isLoading ? Color.gray.opacity(0.3) : Color.blue)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .skeleton(isLoading: isLoading)
            
            // 스켈레톤 카드 예제
            VStack(alignment: .leading, spacing: 10) {
                Rectangle()
                    .fill(isLoading ? Color.gray.opacity(0.3) : Color.green)
                    .frame(height: 20)
                    .frame(width: 150)
                    .cornerRadius(4)
                
                Rectangle()
                    .fill(isLoading ? Color.gray.opacity(0.3) : Color.green)
                    .frame(height: 20)
                    .cornerRadius(4)
                
                Rectangle()
                    .fill(isLoading ? Color.gray.opacity(0.3) : Color.green)
                    .frame(height: 20)
                    .frame(width: 200)
                    .cornerRadius(4)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
            .shadow(radius: 2)
            .skeleton(isLoading: isLoading)
            
            // 로딩 상태 토글 버튼
            Button(action: {
                withAnimation {
                    isLoading.toggle()
                }
            }) {
                Text(isLoading ? "데이터 로드" : "로딩으로 돌아가기")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

// 더 고급스러운 스켈레톤 구현 - 커스텀 모양
struct SkeletonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: 8, height: 8))
        return path
    }
}


// 더 고급스러운 스켈레톤 뷰 예제
struct AdvancedSkeletonView<Content: View>: View {
    let isLoading: Bool
    let content: Content
    
    init(isLoading: Bool, @ViewBuilder content: () -> Content) {
        self.isLoading = isLoading
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            if isLoading {
                content
                    .hidden()
                    .overlay(
                        SkeletonShape()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.gray.opacity(0.2), Color.gray.opacity(0.5), Color.gray.opacity(0.2)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .transition(.opacity)
                            .shimmering()
                    )
            } else {
                content
            }
        }
    }
}

// 시머링(shimmer) 효과를 위한 수정자
struct ShimmeringModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .modifier(AnimatingMask(phase: phase))
            .onAppear {
                withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    self.phase = 1
                }
            }
    }
    
    struct AnimatingMask: AnimatableModifier {
        var phase: CGFloat
        
        var animatableData: CGFloat {
            get { phase }
            set { phase = newValue }
        }
        
        func body(content: Content) -> some View {
            content
                .mask(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.clear, .white, .clear]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .offset(x: -0.5 + phase * 2, y: 0)
                        .frame(width: UIScreen.main.bounds.width * 2)
                )
        }
    }
}

extension View {
    func shimmering() -> some View {
        modifier(ShimmeringModifier())
    }
}

// 실제 사용 예제
struct ProfileCardSkeletonView: View {
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            AdvancedSkeletonView(isLoading: isLoading) {
                HStack(spacing: 16) {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("홍길동")
                            .font(.headline)
                        Text("안녕하세요! 반갑습니다.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 2)
            }
            
            Button(action: {
                withAnimation {
                    isLoading.toggle()
                }
            }) {
                Text(isLoading ? "데이터 로드" : "로딩으로 돌아가기")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    ProfileCardSkeletonView()
}
