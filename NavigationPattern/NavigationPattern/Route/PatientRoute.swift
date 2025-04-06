//
//  PatientRoute.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

enum PatientRoute: Hashable {
    case list
    case detail(Patient)

    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            Text("Patient List Screen")
        case .detail(let patient):
            Text("Patient Detail: \(patient.name)")
        }
    }
}
