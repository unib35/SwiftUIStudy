//
//  Item.swift
//  SwiftDataDemo
//
//  Created by 이종민 on 1/16/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
