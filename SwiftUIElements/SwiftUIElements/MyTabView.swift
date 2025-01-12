//  TabViewExamples.swift
//  SwiftUIElements
//
//  Created by 이종민 on 1/12/25.
//

import SwiftUI

struct TabViewExamples: View {
    var body: some View {
        TabView {
            // 1. 첫 번째 탭
            Text("Home View")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            // 2. 두 번째 탭
            VStack {
                Text("Settings View")
                Toggle("Option 1", isOn: .constant(true))
                Toggle("Option 2", isOn: .constant(false))
            }
            .tabItem {
                Image(systemName: "gearshape.fill")
                Text("Settings")
            }

            // 3. 세 번째 탭
            VStack {
                Text("Profile View")
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Profile")
            }
        }
        .accentColor(.blue) // 탭 아이템 색상 설정
    }
}

#Preview {
    TabViewExamples()
}
