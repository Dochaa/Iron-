//
//  SildeCardioView.swift
//  Iron
//
//  Created by Akaradach Choeychusri on 7/4/2567 BE.
//  Copyright © 2567 BE Kiw. All rights reserved.
//

import SwiftUI

struct SildeCardioView: View {
    @State private var selection = 0

    var body: some View {
        VStack {
            TabView(selection: $selection) {
                RunningView(workout: MockWorkoutData.metricRandom.currentWorkout)
                    .tag(0)
                    .tabItem {
                        Image(systemName: "figure.walk")
                        Text("Running")
                    }
                
                ExerciseView(workout: MockWorkoutData.metricRandom.currentWorkout) // Replace with your actual data or context
                    .tag(1)
                    .tabItem {
                        Image(systemName: "heart.text.square")
                        Text("Exercise")
                    }
            }
            .tabViewStyle(PageTabViewStyle())

            // Swipe indicator
            Text("Swipe to change view")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
        .edgesIgnoringSafeArea(.all) // Ensures the content stretches to the edges
    }
}

// Your RunningView and ExerciseView structs remain unchanged here...

