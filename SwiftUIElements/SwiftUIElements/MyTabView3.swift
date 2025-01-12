//  TabViewStyleExamples.swift
//  SwiftUIElements
//
//  Created by 이종민 on 1/12/25.
//

import SwiftUI

struct TabViewStyleExamples: View {
    @State private var selectedTab: Int = 0 // 현재 선택된 탭을 추적

    var body: some View {
        VStack(spacing: 20) {
            Text("TabView Style")
                .font(.largeTitle)
                .padding()

            // TabView with `.always` tab bar visibility
            Text("TabView with Tab Bar Always Visible")
                .font(.headline)

            TabView(selection: $selectedTab) {
                Text("Home View")
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)

                Text("Search View")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(1)

                Text("Profile View")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(height: 150)
            .background(Color.gray.opacity(0.2))

            // TabView with `.never` tab bar visibility
            Text("TabView with Tab Bar Never Visible")
                .font(.headline)

            TabView(selection: $selectedTab) {
                Text("Home View")
                    .tag(0)

                Text("Search View")
                    .tag(1)

                Text("Profile View")
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 150)
            .background(Color.blue.opacity(0.2))

            // TabView with `.automatic` tab bar visibility
            Text("TabView with Tab Bar Automatic")
                .font(.headline)

            TabView(selection: $selectedTab) {
                Text("Home View")
                    .tag(0)

                Text("Search View")
                    .tag(1)

                Text("Profile View")
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .frame(height: 150)
            .background(Color.green.opacity(0.2))
        }
        .padding()
    }
}

#Preview {
    TabViewStyleExamples()
}
