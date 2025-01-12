//  MyVStack.swift
//  SwiftUIElements
//
//  Created by 이종민 on 1/12/25.
//

import SwiftUI

struct MyVStack: View {
    var body: some View {
        // VStack 기본구조
        VStack {
            Text("Top")
            Text("Middle")
            Text("Bottom")
        }

        // 1. 기본 정렬 -> 뷰들이 기본적으로 중앙에 정렬됨.
        VStack {
            Text("Hello")
            Text("World")
        }

        // 2. alignment 정렬
        // .leading .center .trailing .firstTextBaseline .lastTextBaseline
        VStack(alignment: .leading) {
            Text("Leading Alignment")
                .border(Color.red)
            Text("Center Alignment")
                .border(Color.blue)
            Text("Trailing Alignment")
                .border(Color.green)
        }

        // 3. spacing 간격
        VStack(spacing: 20) {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
        }

        // 4. frame 크기 지정
        // maxHeight: .infinity는 VStack이 가능한 공간을 모두 차지하도록 설정
        VStack {
            Text("Hello")
            Text("World")
        }
        .frame(maxWidth: 200, maxHeight: .infinity)
        .background(Color.gray)

        // 5. 유연한 레이아웃
        VStack {
            Text("Flexible Top")
                .frame(maxHeight: .infinity)
                .background(Color.red)

            Text("Flexible Bottom")
                .frame(maxHeight: .infinity)
                .background(Color.blue)
        }
        .frame(width: 200)
        .border(Color.black)

        // 6. 고정 크기와 동적 크기 혼합
        VStack {
            Text("Fixed")
                .frame(height: 100)
                .background(Color.green)

            Text("Flexible")
                .frame(maxHeight: .infinity)
                .background(Color.orange)
        }
        .frame(width: 200)
        .border(Color.black)

        // 7. 제스처를 활용한 VStack
        VStack {
            Text("Tap Me")
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                .onTapGesture {
                    print("Tapped on Tap Me")
                }

            Text("Or Tap Me")
                .padding()
                .background(Color.purple)
                .cornerRadius(8)
                .onTapGesture {
                    print("Tapped on Or Tap Me")
                }
        }
        .frame(width: 200)
    }
}

#Preview {
    MyVStack()
}
