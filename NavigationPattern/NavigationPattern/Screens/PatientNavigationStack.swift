//
//  PatientNavigationStack.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct PatientNavigationStack: View {
    @State private var routes: [PatientRoute] = []

    var body: some View {
        NavigationStack(path: $routes) {
            PatientDashboardScreen()
                .navigationDestination(for: PatientRoute.self) { route in
                    route.destination
                }
        }
        .environment(\.navigate, NavigateAction { route in
            if case let .patient(patientRoute) = route {
                routes.append(patientRoute)
            }
        })
    }
}

#Preview {
    PatientNavigationStack()
}
