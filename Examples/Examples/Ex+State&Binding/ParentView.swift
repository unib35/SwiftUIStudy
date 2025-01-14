//
//  ParentView.swift
//  Examples
//
//  Created by 이종민 on 1/13/25.
//

import SwiftUI

struct ParentView: View {
    @State private var count = 0 // 부모 상태 관리
    
    var body: some View {
        VStack {
            Text("Parent Count : \(count)")
                .font(.largeTitle)
                .padding()
            
            Button("부모뷰에서 증가") {
                count += 1 // 부모 상태 변경
            }
            .padding()
            
            
            ChildView(count: $count) // 자식 뷰에 상태 전달
            
        }
        .padding()
    }
}

#Preview {
    ParentView()
}
