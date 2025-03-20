//
//  SkeletonView.swift
//  SkeletonDemo
//
//  Created by 이종민 on 3/20/25.
//

import SwiftUI


//redacted(reason: .placeholder): SwiftUI에서 기본적으로 제공하는 스켈레톤 효과.
struct SkeletonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Hello")
                .font(.title)
                .redacted(reason: .placeholder)
            Text("World")
                .font(.title)
                .redacted(reason: .placeholder)
        }
        .padding()
        
        
    }
}

#Preview {
    SkeletonView()
}
