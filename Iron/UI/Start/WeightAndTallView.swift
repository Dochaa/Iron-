//
//  WeightAndTallView.swift
//  Iron
//
//  Created by Akaradach Choeychusri on 7/4/2567 BE.
//  Copyright © 2567 BE Kiw. All rights reserved.
//

import SwiftUI

struct WeightAndTallView: View {
    @State private var weight: Double = 0 // น้ำหนักเริ่มต้น
    @State private var height: Double = 0 // ความสูงเริ่มต้น
    @State private var isNextButtonTapped = false
    
    var body: some View {
        VStack {
            Text("WeightAndTallView")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.7))
            Text("*Plase select your Weight and TallView")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                .padding(.bottom, 50)
            
            VStack {
                VStack {
                    Text("Weight")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.7))
                    .padding(.bottom,1)
                    Text("\(String(format: "%.1f", weight)) kg")
                        .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                }
                .padding(.bottom, 20)
                Slider(value: $weight, in: 0...150, step: 0.1)
                    .padding(.horizontal)
                    .padding(.bottom, 50)

                VStack {
                    Text("Height")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.7))
                        .padding(.bottom,1)
                    Text("\(String(format: "%.1f", height)) cm")
                        .fontWeight(.semibold)
                        .font(.title2)
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                        .padding(.bottom,10)
                }
                .padding(.bottom, 20)
                Slider(value: $height, in: 0...250, step: 0.1)
                    .padding(.horizontal)
                    .padding(.bottom, 50)
            }

            Button(action: {
                isNextButtonTapped = true
            }) {
                Text("Next")
                    .fontWeight(.bold)
                    .frame(width: 120, height: 25)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 0.0, green: 0.0, blue: 0.7))
                    .cornerRadius(25)
                    .padding(.all)
            }
        }
        .padding(.horizontal,30)
        .background(Color(red: 1, green: 1, blue: 1).edgesIgnoringSafeArea(.all))
    }
}

struct WeightAndTallView_Previews: PreviewProvider {
    static var previews: some View {
        WeightAndTallView()
    }
}



