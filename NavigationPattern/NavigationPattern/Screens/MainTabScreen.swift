//
//  MainTabScreen.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct MainTabScreen: View {
    @State private var selection: AppScreen? = .patients

    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination
                    .tabItem { screen.label }
                    .tag(screen as AppScreen?)
            }
        }
    }
}

#Preview {
    MainTabScreen()
}
