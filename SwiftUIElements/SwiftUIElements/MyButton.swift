//
//  MyButton.swift
//  SwiftUIElements
//
//  Created by 이종민 on 1/12/25.
//

import SwiftUI

struct MyButton: View {
    var body: some View {
        // 1. 기본 텍스트 버튼
        Button("1. 기본 텍스트 버튼") {
            print("1번 버튼 클릭됨")
        }
        
        // 2. Label을 사용하는 버튼
        Button {
            print("2번 버튼 클릭됨")
        } label: {
            Label("2. Label 사용 버튼", systemImage: "gear")
        }
        
        // 3. 커스텀 뷰를 레이블로 사용하는 버튼
        Button {
            print("3번 버튼 클리됨")
        } label: {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                Text("3. Custom뷰 Label 버튼")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        }
        
        // 4. Role을 지정한 버튼 (iOS15 이상 지원)
        Button("4. Role 지정 버튼", role: .destructive) {
            print("4번 버튼 클릭됨")
        }
        
        // 5. ButtonStyle을 사용한 버튼
        // 아래 스타일 선언됨
        Button("5. ButtonStyle 버튼") {
            print("5번 버튼 클릭됨")
        }
        .buttonStyle(CustomButtonStyle())
        
        
        // 6. 제스처를 활용한 버튼
        Text("6. 제스처 활용 버튼")
            .padding()
            .background(Color.gray)
            .cornerRadius(8)
            .onTapGesture {
                print("6번 버튼 클릭됨")
            }

        
    }
}

#Preview {
    MyButton()
}

//5번 버튼 스타일
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? Color.red : Color.green)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}
