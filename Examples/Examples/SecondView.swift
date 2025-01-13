//
//  SecondView.swift
//  Examples
//
//  Created by 이종민 on 1/13/25.
//

import SwiftUI

struct SecondView: View {
    @Environment(TimerData.self) var timerData
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    SecondView()
        .environment(TimerData())
}
