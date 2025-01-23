//
//  ContentView.swift
//  UIViewControllerDemo
//
//  Created by 이종민 on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    @State var imagePickerVisible: Bool = false
    @State var selectedImage: Image? = Image(systemName: "photo")
    
    var body: some View {
        ZStack {
            VStack {
                selectedImage?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Button(action: {
                    self.imagePickerVisible.toggle()
                }, label: {
                    Text("Select an Image")
                })
            }
            .padding()
            
            if(imagePickerVisible) {
                MyImagePicker(imagePickerVisible: $imagePickerVisible, selectedImage: $selectedImage)
            }
        }
    }
}

#Preview {
    ContentView()
}
