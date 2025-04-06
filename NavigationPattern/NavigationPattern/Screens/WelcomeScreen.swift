//
//  WelcomeScreen.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct WelcomeScreen: View {
    @Environment(\.navigate) private var navigate

    var body: some View {
        VStack(spacing: 16) {
            Text("Welcome to the App")
                .font(.largeTitle)

            Button("로그인하기") {
                Task {
                    try? await Task.sleep(for: .seconds(1))
                    print("로그인 성공")
                    navigate(.mainTab)
                }
            }
        }
        .padding()
    }
}

#Preview {
    WelcomeScreen()
}
