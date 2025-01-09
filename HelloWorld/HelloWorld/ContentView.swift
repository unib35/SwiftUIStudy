//
//  ContentView.swift
//  HelloWorld
//
//  Created by 이종민 on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Text1")
            Text("Text3")
            //Text() + 연산자는 배열하는것이 아닌 하나의 텍스트로 붙여버린다.
            Text("Hello ") + Text("World!")
            Text("Text6")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
