//
//  ShareLinkDemo.swift
//  SheetDemo
//
//  Created by 이종민 on 3/8/25.
//

import SwiftUI

struct ShareLinkDemo: View {
    let textToShare = "공유할 내용입니다!"

        var body: some View {
            if #available(iOS 16.0, *) {
                ShareLink("공유하기", item: textToShare)
                    .padding()
            } else {
                // iOS 16 미만에서는 기존 방식(UIViewControllerRepresentable)을 사용
                Button("공유하기") {
                    // 공유 로직 구현 (예: ShareSheet 호출)
                }
            }
        }
}

#Preview {
    ShareLinkDemo()
}
