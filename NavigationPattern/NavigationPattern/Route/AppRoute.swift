//
//  AppRoute.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

enum Route: Hashable, Equatable {
    case login
    case mainTab
    case patient(PatientRoute)
    case doctor(DoctorRoute)
}
