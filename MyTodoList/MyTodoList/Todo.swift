//
//  Todo.swift
//  MyTodoList
//
//  Created by 이종민 on 1/17/25.
//

import Foundation
import SwiftData

@Model
final class Todo {
    @Attribute(.unique)
    var id: UUID
    
    var title: String
    var isCompleted: Bool
    var priority: Int? = nil
    var timestamp: Date
    var dueDate: Date? = nil
    var category: String? = nil
    var notes: String? = nil
    
    init(title: String, isCompleted: Bool = false, priority: Int = 1, timestamp: Date = Date(), dueDate: Date? = nil, category: String? = nil, notes: String? = nil) {
            self.id = UUID()
            self.title = title
            self.isCompleted = isCompleted
            self.priority = priority
            self.timestamp = timestamp
            self.dueDate = dueDate
            self.category = category
            self.notes = notes
        }
    
    func toggleCompletion() {
        isCompleted.toggle()
    }
}
