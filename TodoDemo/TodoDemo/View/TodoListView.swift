//
//  TodoListView.swift
//  TodoDemo
//
//  Created by 이종민 on 1/20/25.
//

import SwiftUI
import SwiftData

enum TodoNavigation: Hashable {
    case detail(TodoItem)
    case edit(TodoItem)
}

struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    
    let searchText: String
    let priorityFilter: Priority?
    
    @Query private var todos: [TodoItem]
    
    init(searchText: String = "", priorityFilter: Priority? = nil) {
        self.searchText = searchText
        self.priorityFilter = priorityFilter
        
        let predicate = #Predicate<TodoItem> { todo in
            searchText.isEmpty ? true : todo.title.contains(searchText) == true
        }
        
        _todos = Query(filter: predicate, sort: [SortDescriptor(\TodoItem.createdAt)])
    }
    
    var filteredTodos: [TodoItem] {
        if let priority = priorityFilter {
            return todos.filter { $0.priority == priority }
        }
        return todos
    }
    
    var body: some View {
        List {
            ForEach(filteredTodos) { item in
                TodoRowView(todo: item)
            }
            .onDelete(perform: deleteItems)
        }
        .navigationDestination(for: TodoNavigation.self) { navigation in
            switch navigation {
                case .detail(let item):
                    TodoDetailView(item: item)
                case .edit(let item):
                    EditTodoView(todo: item)
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
    
}

#Preview {
    TodoListView()
        .modelContainer(PreviewContainer.shared.container)
}
