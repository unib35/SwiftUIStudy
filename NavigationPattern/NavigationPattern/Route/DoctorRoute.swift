//
//  DoctorRoute.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

enum DoctorRoute: Hashable {
    case list
    case detail(Doctor)

    @ViewBuilder
    var destination: some View {
        switch self {
        case .list:
            Text("Doctor List Screen")
        case .detail(let doctor):
            Text("Doctor Detail: \(doctor.name)")
        }
    }
}
