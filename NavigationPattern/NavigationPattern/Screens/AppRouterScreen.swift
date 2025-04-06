//
//  AppRouterScreen.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct AppRouterScreen: View {
    @State private var navState = NavigationState()

    var body: some View {
        NavigationStack(path: $navState.routes) {
            // 첫 화면은 WelcomeView
            WelcomeScreen()
                .navigationDestination(for: Route.self) { route in
                    destination(for: route)
                }
        }
        .environment(\.navigate, NavigateAction { route in
            navState.routes.append(route)
        })
        .environment(navState)
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case .login:
            WelcomeScreen()
        case .mainTab:
            MainTabScreen()
        case .patient(let patientRoute):
            patientRoute.destination
        case .doctor(let doctorRoute):
            doctorRoute.destination
        }
    }
}

#Preview {
    AppRouterScreen()
}
