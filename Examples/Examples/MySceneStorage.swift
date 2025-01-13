//
//  MySceneStorage.swift
//  Examples
//
//  Created by 이종민 on 1/13/25.
//

import SwiftUI

struct MySceneStorage: View {
    @SceneStorage("city") var city: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello World!")
            TextEditor(text: $city)
                .font(.largeTitle)
                .border(Color.blue)
        }
    }
}

#Preview {
    MySceneStorage()
}
