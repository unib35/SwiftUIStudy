//
//  TodoRowView.swift
//  TodoDemo
//
//  Created by 이종민 on 1/20/25.
//

import SwiftUI

struct TodoRowView: View {
    let item: TodoItem
    
    var body: some View {
        NavigationLink {
            TodoDetailView(item: item)
        } label: {
            Text("\(item.title) at \(item.createdAt, format: Date.FormatStyle(date: .numeric, time: .standard))")
        }
    }
}

#Preview {
    TodoRowView(item: TodoItem(title: "Hello, world!"))
}
