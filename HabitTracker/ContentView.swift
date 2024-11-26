//
//  ContentView.swift
//  HabitTracker
//
//  Created by Juan Alfaro on 11/25/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Habit.dateAdded, order: .forward) private var habits: [Habit]
    @State private var showingAddHabit = false
    @State private var lastResetDate = UserDefaults.standard.object(forKey: "lastResetDate") as? Date ?? Date()

    var body: some View {
            NavigationStack {
                List {
                    ForEach(habits) { habit in
                        NavigationLink(destination: HabitDetailView(habit: habit)) {
                            HStack {
                                Text(habit.name)
                                    .font(.headline)
                                Spacer()
                                Image(systemName: habit.completed ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(habit.completed ? .green : .gray)
                                    .onTapGesture {
                                        withAnimation {
                                            habit.completed.toggle()
                                        }
                                    }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .onDelete(perform: deleteHabit)
                }
                .navigationTitle("Habit Tracker")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack {
                            EditButton()
                            Button("Reset") {
                                resetHabits()
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingAddHabit = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddHabit) {
                    AddHabitView()
                }
                .onAppear {
                    checkForDailyReset()
                }
            }
        }
        
        // MARK: - Functions
        
        /// Deletes habits at the given offsets from the habits array.
        func deleteHabit(at offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    let habit = habits[index]
                    modelContext.delete(habit)
                }
            }
        }
        
        /// Resets the completion status of all habits and updates the last reset date.
        func resetHabits() {
            withAnimation {
                for habit in habits {
                    habit.completed = false
                }
            }
            lastResetDate = Date()
            UserDefaults.standard.set(lastResetDate, forKey: "lastResetDate")
        }
        
        /// Checks if the last reset date is not today and resets habits if necessary.
        func checkForDailyReset() {
            let calendar = Calendar.current
            if !calendar.isDateInToday(lastResetDate) {
                resetHabits()
            }
        }
    }

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
