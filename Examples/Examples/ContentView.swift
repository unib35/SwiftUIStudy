//
//  ContentView.swift
//  Examples
//
//  Created by 이종민 on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    @State var timerData: TimerData = TimerData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Button(action: resetCount) {
                    Text("Reset Counter")
                }
                
                NavigationLink("Next Screen", destination: {
                    SecondView()
                })
            }
        }
        .environment(timerData)
    }
    
    func resetCount() {
        timerData.resetCount()
    }
}

#Preview {
    ContentView()
}
