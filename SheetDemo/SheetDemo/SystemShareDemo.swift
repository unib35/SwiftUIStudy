//
//  SystemShareDemo.swift
//  SheetDemo
//
//  Created by 이종민 on 3/8/25.
//

import SwiftUI

struct SystemShareDemo: View {
    @State private var isShowingShareSheet = false
    let textToShare = "공유할 내용"
    
    var body: some View {
        Button("공유하기") {
            isShowingShareSheet = true
        }
        .sheet(isPresented: $isShowingShareSheet){
            ShareSheet(activityItems: [textToShare])
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // 업데이트가 필요할 경우 구현
    }
}

#Preview {
    SystemShareDemo()
}
