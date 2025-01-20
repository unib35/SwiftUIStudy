//
//  ContentView.swift
//  MyTodoList
//
//  Created by 이종민 on 1/17/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todos: [Todo]
    
    init() {
        setupNavigationBarAppearance()
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(todos) { todo in
                    HStack {
                        Button(action: {
                            print(#fileID, #function, #line, "- Todo 완료 버튼")
                            todo.isCompleted.toggle()
                            saveChanges()
                        }, label: {
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                        })
                        TextField("Enter Todo", text: Binding(
                            get: { todo.title },
                            set: { newValue in
                                todo.title = newValue
                                saveChanges()
                            }
                        ))
                        .background(Color.blue)
                        .frame(maxHeight: .infinity)
                    }
                    .frame(maxHeight: .infinity)
                }
                .onDelete(perform: deleteItems)
                .frame(maxHeight: .infinity)
            }
            .navigationTitle("투두 리스트")
            .listStyle(PlainListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newTodo = Todo(title: "test")
            modelContext.insert(newTodo)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(todos[index])
            }
        }
    }
    
    private func saveChanges() {
        do {
            try modelContext.save()
        } catch {
            print("Error saving changes: \(error)")
        }
    }
    
    
    
    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground() // 투명도 없이 배경 설정
        appearance.backgroundColor = UIColor.white // 배경색 설정
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemOrange, // 제목 텍스트 색상
            .font: UIFont.systemFont(ofSize: 20, weight: .bold) // 제목 폰트 설정
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.systemOrange, // 큰 제목 텍스트 색상
            .font: UIFont.systemFont(ofSize: 30, weight: .heavy) // 큰 제목 폰트 설정
        ]
        
        // 모든 UINavigationBar에 Appearance 적용
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Todo.self, inMemory: true)
}
