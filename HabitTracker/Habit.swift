//
//  Habit.swift
//  HabitTracker
//
//  Created by Juan Alfaro on 11/25/24.
//

import Foundation
import SwiftUI
import SwiftData


@Model
class Habit: Identifiable {
    @Attribute(.unique) var id: UUID
    var name: String
    var completed: Bool = false
    var dateAdded: Date

    init(name: String) {
        self.id = UUID()
        self.name = name
        self.completed = false
        self.dateAdded = Date()
    }
}

