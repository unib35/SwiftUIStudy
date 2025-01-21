//
//  Category.swift
//  TodoDemo
//
//  Created by 이종민 on 1/21/25.
//

import Foundation
import SwiftData

@Model
final class Category {
    var id: String = UUID().uuidString
    var name: String?
    
    @Relationship(deleteRule: .cascade)
    var todos: [TodoItem]? = []
    
    init(name: String) {
        self.name = name
    }
}
