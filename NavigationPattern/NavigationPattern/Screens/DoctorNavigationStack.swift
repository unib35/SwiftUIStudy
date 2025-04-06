//
//  DoctorNavigationStack.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct DoctorNavigationStack: View {
    @State private var routes: [DoctorRoute] = []

    var body: some View {
        NavigationStack(path: $routes) {
            DoctorDashboardScreen()
                .navigationDestination(for: DoctorRoute.self) { route in
                    route.destination
                }
        }
        .environment(\.navigate, NavigateAction { route in
            if case let .doctor(doctorRoute) = route {
                routes.append(doctorRoute)
            }
        })
    }
}

#Preview {
    DoctorNavigationStack()
}
