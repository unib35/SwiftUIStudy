//
//  ContentView.swift
//  TodoListDemo
//
//  Created by 이종민 on 1/14/25.
//

import SwiftUI

struct ToDoItem: Identifiable {
    let id: UUID = UUID()
    var task: String
    var imageName: String
}


struct ContentView: View {
    @State var toggleStatus: Bool = false
    
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    var body: some View {
        List {
            Section(header: Text("Settings")) {
                Toggle(isOn: $toggleStatus) {
                    Text("Allow Notifications")
                }
            }
            
            
            Section(header: Text("To do tasks").textCase(nil)){
                ForEach(listData) { item in
                    HStack{
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
            }
        }
        .refreshable {
            listData = [
                ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
            ]
        }
    }
}

#Preview {
    ContentView()
}
