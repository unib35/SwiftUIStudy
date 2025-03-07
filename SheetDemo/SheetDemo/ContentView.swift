//
//  ContentView.swift
//  SheetDemo
//
//  Created by 이종민 on 3/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingCustomShareSheet = false
    let contentToShare = "공유할 내용입니다!"
    
    var body: some View {
        VStack{
            Text("Hello World")
                .fontWeight(.bold)
            Text("Hello World")
                .fontWeight(.bold)
            Text("Hello World")
                .fontWeight(.bold)
            Text("Hello World")
                .fontWeight(.bold)
            Text("Hello World")
                .fontWeight(.bold)
        }
        
        Button("공유하기") {
            isShowingCustomShareSheet = true
        }
        .sheet(isPresented: $isShowingCustomShareSheet) {
            CustomShareSheetDemo(contentToShare: contentToShare)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)  // 또는 .hidden
                .presentationCornerRadius(20)
                
        }
        
        
        .padding()
        .background(.black)
        
    }
    
}



#Preview {
    ContentView()
}
