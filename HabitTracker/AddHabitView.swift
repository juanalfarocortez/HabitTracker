//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Juan Alfaro on 11/25/24.
//

import SwiftUI
import SwiftData

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) private var modelContext
    @State private var habitName: String = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Habit Name", text: $habitName)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveHabit()
                    }
                    .disabled(habitName.isEmpty)
                }
            }
        }
    }

    func saveHabit() {
        let newHabit = Habit(name: habitName)
        modelContext.insert(newHabit)
        presentationMode.wrappedValue.dismiss()
    }
}
