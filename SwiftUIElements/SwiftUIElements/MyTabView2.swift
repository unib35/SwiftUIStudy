//  TabViewSelection.swift
//  SwiftUIElements
//
//  Created by 이종민 on 1/12/25.
//

import SwiftUI

struct TabViewSelection: View {
    @State private var selectedTab: Int = 0 // 현재 선택된 탭을 추적

    var body: some View {
        VStack {
            Text("Currently Selected Tab: \(selectedTab)")
                .font(.headline)
                .padding()

            TabView(selection: $selectedTab) {
                // 1. 첫 번째 탭
                Text("Home View")
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0) // 각 탭에 고유 태그 부여

                // 2. 두 번째 탭
                VStack {
                    Text("Search View")
                    TextField("Search something", text: .constant("")).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)

                // 3. 세 번째 탭
                VStack {
                    Text("Profile View")
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.purple)
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
            }
            .accentColor(.blue) // 탭 선택 시 색상 변경
        }
    }
}

#Preview {
    TabViewSelection()
}
