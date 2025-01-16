//
//  ContentView.swift
//  ImageDocDemo
//
//  Created by 이종민 on 1/16/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: ImageDocDemoDocument

    var body: some View {
        VStack {
            Image(uiImage: document.image)
                .resizable()
                .padding()
                .aspectRatio(contentMode: .fit)
            Button(action: {
                
            }, label:  {
                Text("Filter Image")
            })
            .padding()
        }
    }
}

#Preview {
    ContentView(document: .constant(ImageDocDemoDocument()))
}
