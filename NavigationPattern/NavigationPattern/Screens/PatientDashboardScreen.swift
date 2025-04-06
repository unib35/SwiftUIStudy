//
//  PatientDashboardScreen.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct PatientDashboardScreen: View {
    @Environment(\.navigate) private var navigate

    var body: some View {
        VStack(spacing: 16) {
            Button("Go to Patient List") {
                navigate(.patient(.list))
            }
            Button("Go to Patient Detail") {
                navigate(.patient(.detail(Patient(name: "John"))))
            }
        }
    }
}

#Preview {
    PatientDashboardScreen()
}
