//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Juan Alfaro on 11/25/24.
//

import SwiftUI
import SwiftData

struct HabitDetailView: View {
    @Bindable var habit: Habit

    var body: some View {
        VStack(spacing: 20) {
            // Display the app logo
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)

            Text(habit.name)
                .font(.largeTitle)
                .bold()

            Toggle("Completed", isOn: $habit.completed)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Habit Details")
    }
}
