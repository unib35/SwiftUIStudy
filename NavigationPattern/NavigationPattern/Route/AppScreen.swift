//
//  AppScreen.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import Foundation
import SwiftUI

enum AppScreen: Hashable, Identifiable, CaseIterable {
    case patients
    case doctors

    var id: Self { self }

    @ViewBuilder
    var label: some View {
        switch self {
        case .patients:
            Label("Patients", systemImage: "heart")
        case .doctors:
            Label("Doctors", systemImage: "star")
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .patients:
            PatientNavigationStack()
        case .doctors:
            DoctorNavigationStack()
        }
    }
}
