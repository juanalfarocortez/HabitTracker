//
//  Item.swift
//  HabitTracker
//
//  Created by Juan Alfaro on 11/25/24.
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
