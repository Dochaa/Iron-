//
//  AgePage.swift
//  Iron
//
//  Created by Akaradach Choeychusri on 7/4/2567 BE.
//  Copyright © 2567 BE Kiw. All rights reserved.
//

import SwiftUI

struct agePage: View {
    @State private var age: Double = 1
    @State private var isNextButtonTapped: Bool = false

    var body: some View {
        VStack {
            Text("Your Age")
                .font(.largeTitle)
                .fontWeight(.bold)
//                .foregroundColor(Color(red: 0.98, green: 0.66, blue: 0.01))
                .foregroundColor(Color(.blue))
                .padding(.top)

            VStack {
                Text("เราจำเป็นต้องทราบอายุของคุณ")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .padding(.bottom)

                Text("อายุ: \(Int(age)) ปี")
                    .font(.title)
//                    .foregroundColor(Color(red: 249/255, green: 166/255, blue: 2/255))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)

                Slider(value: $age, in: 1...80, step: 1)
                    .padding(.horizontal, 50)

                Button(action: {
                    isNextButtonTapped = true
                    // Additional actions to proceed to the next step can be placed here if needed
                }) {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.blue))
//                        .background(Color(red: 249/255, green: 166/255, blue: 2/255))
                        .cornerRadius(10)
                }
//                .opacity(isNextButtonTapped ? 0.5 : 1)
//                .disabled(isNextButtonTapped)
                .frame(width: 350, height: 60)
                .padding(.bottom, 50)
            }
//            .navigationBarTitle("", displayMode: .inline)
           
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 180/255, green: 180/255, blue: 180/255).edgesIgnoringSafeArea(.all))
    }
}

struct agePage_Previews: PreviewProvider {
    static var previews: some View {
        agePage()
    }
}
