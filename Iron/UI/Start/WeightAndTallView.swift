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
            Spacer()
            Text("WeightAndTallView")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(Color(.blue))
            Text("*Plase select your Weight and TallView")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(((weight == 0 || height == 0 ) && isNextButtonTapped) ? .red : .black) // เช็คเงื่อนไขการทำงานของแต่ละค่า
                .padding(.bottom)
                .scaleEffect(((weight == 0 || height == 0 ) && isNextButtonTapped) ? 1.1 : 1.0) // ให้ข้อความมีการ Scale ตามเงื่อนไข
                .animation(.easeInOut) // เพิ่ม animation

            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            VStack {
                VStack {
                    Text("Weight")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color(.blue))
                    Text("\(String(format: "%.1f", weight)) kg")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color(.blue))
                }
                .padding(.bottom, 20)
                Slider(value: $weight, in: 0...150, step: 0.1)
                    .padding(.horizontal)
                
                VStack {
                    Text("Height")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color(.blue))
                    Text("\(String(format: "%.1f", height)) cm")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color(.blue))
                }
                .padding(.bottom, 20)
                Slider(value: $height, in: 0...250, step: 0.1)
                    .padding(.horizontal)
                Spacer()
                Spacer()
                Spacer()
            }
            Spacer()
            Spacer()
            Button(action: {
                isNextButtonTapped = true
            }) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.blue))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
            }
            Spacer()
                .padding()
        }
        .background(Color(red: 180/255, green: 180/255, blue: 180/255).edgesIgnoringSafeArea(.all))
    }
}

struct WeightAndTallView_Previews: PreviewProvider {
    static var previews: some View {
        WeightAndTallView()
    }
}



