//
//  DoctorDashboardScreen.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct DoctorDashboardScreen: View {
    @Environment(\.navigate) private var navigate

    var body: some View {
        VStack(spacing: 16) {
            Button("Go to Doctor List") {
                navigate(.doctor(.list))
            }
            Button("Go to Doctor Detail") {
                navigate(.doctor(.detail(Doctor(name: "Dr. Jane"))))
            }
        }
    }
}

#Preview {
    DoctorDashboardScreen()
}
