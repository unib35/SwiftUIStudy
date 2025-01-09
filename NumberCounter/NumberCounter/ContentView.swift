//
//  ContentView.swift
//  NumberCounter
//
//  Created by 이종민 on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20){
            Text("Count")
                .font(.largeTitle)
            Text("\(count)")
                .font(.system(size:100))
                .fontWeight(.bold)
                .foregroundColor(count % 2 == 0 ? .blue : .red)
            
            HStack {
                Button(action:{
                    self.count -= 1
                }, label: {
                    Text("-")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.gray)
                        .clipShape(.circle)
                        .foregroundStyle(.white)
                })
                
                Spacer()
                
                Button(action: {
                    self.count += 1
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.green)
                        .clipShape(.circle)
                        .foregroundStyle(.white)
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
