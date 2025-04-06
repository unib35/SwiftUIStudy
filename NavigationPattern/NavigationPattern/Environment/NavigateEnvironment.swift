//
//  NavigateEnvironment.swift
//  NavigationPattern
//
//  Created by 이종민 on 4/6/25.
//

import SwiftUI

struct NavigateAction {
    typealias Action = (Route) -> Void
    let action: Action

    func callAsFunction(_ route: Route) {
        print("[Navigation] 이동 요청: \(route)")
        action(route)
    }
}

private struct NavigateEnvironmentKey: EnvironmentKey {
    static let defaultValue: NavigateAction = NavigateAction { _ in }
}

extension EnvironmentValues {
    var navigate: NavigateAction {
        get { self[NavigateEnvironmentKey.self] }
        set { self[NavigateEnvironmentKey.self] = newValue }
    }
}
