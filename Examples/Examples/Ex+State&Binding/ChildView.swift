//
//  ChildView.swift
//  Examples
//
//  Created by 이종민 on 1/13/25.
//

import SwiftUI

struct ChildView: View {
    @Binding var count : Int // 부모 상태를 참조
    
    var body: some View {
        VStack {
            Text("Child Count: \(count)")
                .font(.title)
                .padding()
            
            Button("자식뷰에서 증가"){
                count += 1
            }
            .padding()
            
        }
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
        .padding()
    }
}

#Preview {
    ChildView(count: .constant(0))
}
