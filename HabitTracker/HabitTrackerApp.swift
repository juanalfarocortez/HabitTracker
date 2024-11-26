//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Juan Alfaro on 11/25/24.
//

import SwiftUI
import SwiftData

@main
struct HabitTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}

