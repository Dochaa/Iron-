//
//  BodyProportionsView .swift
//  Iron
//
//  Created by Akaradach Choeychusri on 7/4/2567 BE.
//  Copyright © 2567 BE Kiw. All rights reserved.
//

import SwiftUI

struct BodyProportionsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var upperArm = 0
    @State private var breast = 0
    @State private var waist = 0
    @State private var hip = 0
    @State private var thigh = 0
    @State private var isNextButtonTapped = false
    @State private var showContentView = false
    
    @Binding var userOnboarded: Bool
    
    
    var body: some View {
     
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Spacer()
                    Text("Body Proportions")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(Color(.blue))
                    Text("*Plase select your Body Proportions")
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(((upperArm == 0 || breast == 0 || waist == 0 || hip == 0 || thigh == 0) && isNextButtonTapped) ? .red : .black) // เช็คเงื่อนไขการทำงานของแต่ละค่า
                        .padding(.bottom)
                        .scaleEffect(((upperArm == 0 || breast == 0 || waist == 0 || hip == 0 || thigh == 0) && isNextButtonTapped) ? 1.1 : 1.0) // ให้ข้อความมีการ Scale ตามเงื่อนไข
                        .animation(.easeInOut) // เพิ่ม animation

                    Spacer()
                    Spacer()
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("Upper arm")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(.blue))
                            Spacer()
                            Picker(selection: $upperArm, label: Text("Upper arm")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                        .foregroundColor(Color(.blue))
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Breast         ")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(.blue))
                            Spacer()
                            Picker(selection: $breast, label: Text("Breast")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                        .foregroundColor(Color(.blue))
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Waist            ")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(.blue))
                            Spacer()
                            Picker(selection: $waist, label: Text("Waist")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                        .foregroundColor(Color(.blue))
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Hip                ")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(.blue))
                            Spacer()
                            Picker(selection: $hip, label: Text("Hip")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                        .foregroundColor(Color(.blue))
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Thigh           ")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(Color(.blue))
                            Spacer()
                            Picker(selection: $thigh, label: Text("Thigh")) {
                                ForEach(0...100, id: \.self) { value in
                                    Text("\(value)")
                                        .foregroundColor(Color(.blue))
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    .padding()
                    
                    Spacer()
                    Button(action: {
                        isNextButtonTapped = true
                           if upperArm != 0 && breast != 0 && waist != 0 && hip != 0 && thigh != 0 {
                               userOnboarded = true // Update this line
                        }
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
                }
                .padding()
            }
            .background(Color(red: 180/255, green: 180/255, blue: 180/255).edgesIgnoringSafeArea(.all))
        }
    }
}

struct BodyProportionsView_Previews: PreviewProvider {
    @State static var userOnboarded = false // Create a static state for the preview

    static var previews: some View {
        BodyProportionsView(userOnboarded: $userOnboarded) // Pass the state as a binding
    }
}


