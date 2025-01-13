//
//  StorageDemo.swift
//  Examples
//
//  Created by 이종민 on 1/13/25.
//

import SwiftUI

struct StorageDemo: View {
    var body: some View {
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    StorageDemo()
}
