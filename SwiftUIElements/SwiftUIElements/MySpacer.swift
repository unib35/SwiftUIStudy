//  SpacerExamples.swift
//  SwiftUIElements
//
//  Created by 이종민 on 1/12/25.
//

import SwiftUI

struct SpacerExamples: View {
    var body: some View {
        // 1. 기본 Spacer
        VStack {
            Text("Top")
            Spacer()
            Text("Bottom")
        }
        .frame(height: 200)
        .border(Color.blue)

        // 2. Spacer로 간격 균등 분배
        HStack {
            Text("Left")
            Spacer()
            Text("Center")
            Spacer()
            Text("Right")
        }
        .frame(width: 300)
        .border(Color.red)

        // 3. Spacer의 비율 설정
        HStack {
            Text("1x")
                .background(Color.yellow)
            Spacer()
            Text("2x")
                .background(Color.green)
            Spacer(minLength: 50)
            Text("Fixed Spacer")
                .background(Color.purple)
        }
        .frame(height: 100)
        .border(Color.black)

        // 4. Spacer로 전체 공간 채우기
        VStack {
            Text("Top")
            Spacer()
            Text("Middle")
            Spacer()
            Text("Bottom")
        }
        .frame(height: 300)
        .border(Color.gray)

        // 5. Spacer와 Frame 혼합
        HStack {
            Text("Fixed Width")
                .frame(width: 100)
                .background(Color.orange)
            Spacer()
            Text("Flexible")
                .background(Color.blue)
        }
        .frame(height: 100)
        .border(Color.green)

        // 6. Spacer로 간격 설정과 색상 강조
        VStack(spacing: 0) {
            Text("No Spacer")
                .background(Color.red)
            Spacer()
                .frame(height: 50)
                .background(Color.gray.opacity(0.5))
            Text("With Spacer")
                .background(Color.green)
        }
        .frame(height: 200)
        .border(Color.black)
    }
}

#Preview {
    SpacerExamples()
}
