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
        NavigationStack {
            List {
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                    
                    NavigationLink(value: listData.count) {
                        Text("View Task Count")
                    }
                }
                
                
                Section(header: Text("To do tasks").textCase(nil)){
                    ForEach(listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            
            
            .navigationTitle(Text("To Do List"))
            // 네비게이션 바 타이블 스타일 변경
            //.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Toolbar에 버튼 추가
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        print("Add button tapped")
                    }) {
                        HStack (spacing: 0) {
                            Text("ADD")
                            Image(systemName: "plus")
                        }
                        
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        print("Add button tapped")
                    }) {
                        Text("EDIT")
                    }
                }
            }
            
            .navigationDestination(for: Int.self) { count in
                Text("Number of tasks: \(count)")
            }
            .navigationDestination(for: String.self) { task in
                VStack {
                    Text("Selected Task: \(task)")
                }
                .background(Color.red)
                
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
    
    func deleteItem(at offsets: IndexSet) {
        print("deleteItem : \(offsets)")
        listData.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        print("source: \(source), destination: \(destination)")
        listData.move(fromOffsets: source, toOffset: destination)
    }
    
}

#Preview {
    ContentView()
}
