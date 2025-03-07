//
//  CustomShareSheetDemo.swift
//  SheetDemo
//
//  Created by 이종민 on 3/8/25.
//

import SwiftUI

struct CustomShareSheetDemo: View {
    @Environment(\.dismiss) var dismiss
    let contentToShare: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("공유하기")
                .font(.headline)
                .padding(.top)
            
            // 메시지로 공유
            Button(action: {
                // 메시지 공유 기능 구현
                print("메시지로 공유 tapped")
                // 실제 공유 기능은 Message 프레임워크 또는 URL Scheme을 활용할 수 있음
                dismiss()
            }) {
                HStack {
                    Image(systemName: "message.fill")
                    Text("메시지로 공유")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
            }
            
            // 이메일로 공유
            Button(action: {
                // 이메일 공유 기능 구현
                print("이메일로 공유 tapped")
                // 실제 이메일 공유는 MFMailComposeViewController 등을 사용해 구현 가능
                dismiss()
            }) {
                HStack {
                    Image(systemName: "envelope.fill")
                    Text("이메일로 공유")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)
            }
            
            // 텍스트 복사
            Button(action: {
                UIPasteboard.general.string = contentToShare
                dismiss()
            }) {
                HStack {
                    Image(systemName: "doc.on.doc.fill")
                    Text("복사")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange.opacity(0.1))
                .cornerRadius(8)
            }
            
            Spacer()
            
            // 취소 버튼
            Button("취소") {
                dismiss()
            }
            .padding()
        }
        .padding()
        .background(.gray)
    }
}

#Preview {
    CustomShareSheetDemo(contentToShare: "Hello")
}
