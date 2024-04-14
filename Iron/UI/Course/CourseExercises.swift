//
//  CourseExercises.swift
//  Iron
//
//  Created by Akaradach Choeychusri on 7/4/2567 BE.
//  Copyright © 2567 BE Kiw. All rights reserved.
//

import SwiftUI

struct CourseExercises: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: NextPage()) {
                    ExerciseRow(imageName: "beginner", text: "Beginner")
                }
                NavigationLink(destination: NextPage()) {
                    ExerciseRow(imageName: "intermediate", text: "intermediate")
                }
                NavigationLink(destination: NextPage()) {
                    ExerciseRow(imageName: "advance", text: "advance")
                }
            }
            .navigationBarTitle("Course Exercises")
        }
    }
}

struct ExerciseRow: View {
    var imageName: String
    var text: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
            Spacer() // ใช้ Spacer เพื่อขยายข้อความไปทางขวา
            Text(text)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(5)
        }
    }
}

struct NextPage: View {
    var body: some View {
        Text("Next Page Content")
            .navigationBarTitle("Next Page")
    }
}

struct CourseExercises_Previews: PreviewProvider {
    static var previews: some View {
        CourseExercises()
    }
}

