//  MyHStack.swift
//  SwiftUIElements
//
//  Created by 이종민 on 1/12/25.
//

import SwiftUI

struct MyHStack: View {
    var body: some View {
        // HStack 기본구조
        HStack {
            Text("Left")
            Text("Center")
            Text("Right")
        }
        
        // 1. 기본 정렬 -> 뷰들이 기본적으로 중앙에 정렬됨.
        HStack {
            Text("Hello")
            Text("World")
        }
        
        // 2. alignment 정렬
        // .top .center .bottom .firstTextBaseLine .lastTextBaseLine
        HStack(alignment: .top) {
            Text("top")
                .border(Color.red)
            Text("Center")
                .border(Color.blue)
            Text("Bottom")
                .border(Color.green)
        }
        
        // 3. spacing 간격
        HStack(spacing: 20) {
            Text("Item 1")
            Text("Item 2")
            Text("Item 3")
        }
        
        // 4. frame 크기 지정
        // maxWidth: .infinity는 HStack이 가능한 공간을 모두 차지하도록 설정
        HStack {
            Text("Hello")
            Text("World")
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.gray)

        // 6. 유연한 레이아웃
        HStack {
            Text("Flexible")
                .frame(maxWidth: .infinity)
                .background(Color.red)

            Text("Content")
                .frame(maxWidth: .infinity)
                .background(Color.blue)
        }
        .frame(height: 50)
        .border(Color.black)

        // 7. 고정 크기와 동적 크기 혼합
        HStack {
            Text("Fixed")
                .frame(width: 100)
                .background(Color.green)

            Text("Flexible")
                .frame(maxWidth: .infinity)
                .background(Color.orange)
        }
        .frame(height: 50)
        .border(Color.black)

        // 8. 제스처를 활용한 HStack
        HStack {
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
        .frame(height: 50)
    }
}

#Preview {
    MyHStack()
}
