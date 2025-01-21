//
//  AddTodoView.swift
//  TodoDemo
//
//  Created by 이종민 on 1/20/25.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                }
            }
            .navigationTitle("New Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button("Cancel") {
                        dismiss()
                    }
                })
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button("Save") {
                        let todo = TodoItem(title: title)
                        modelContext.insert(todo)
                        dismiss()
                    }
                })
            }
        }
    }
}

#Preview {
    AddTodoView()
}
