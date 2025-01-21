//
//  ContentView.swift
//  TodoDemo
//
//  Created by 이종민 on 1/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showingAddTodo = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            TodoListView(searchText: searchText)
                .searchable(text: $searchText)
                .navigationTitle("Todo List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: {
                            showingAddTodo = true
                        }) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddTodo) {
                    AddTodoView()
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(PreviewContainer.shared.container)
}
