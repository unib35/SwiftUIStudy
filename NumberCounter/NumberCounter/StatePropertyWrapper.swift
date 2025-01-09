//
//  StatePropertyWrapper.swift
//  NumberCounter
//
//  Created by 이종민 on 1/9/25.
//

import SwiftUI

struct StatePropertyWrapper: View {
    @State private var wifiEnabled: Bool = true
    @State private var userName: String = ""
    
    var body: some View {
        VStack {
            Toggle("Enable Wi-Fi", isOn: $wifiEnabled)
            TextField("Enter user name", text: $userName)
            Text(userName)
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
        }
        .padding()
    }
}

#Preview {
    StatePropertyWrapper()
}
