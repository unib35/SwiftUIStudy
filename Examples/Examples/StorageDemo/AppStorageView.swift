//
//  AppStorageView.swift
//  Examples
//
//  Created by 이종민 on 1/13/25.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("mytext") var editorText: String = ""
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

#Preview {
    AppStorageView()
}
