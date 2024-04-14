//
//  GenderPage.swift
//  Iron
//
//  Created by Akaradach Choeychusri on 7/4/2567 BE.
//  Copyright © 2567 BE Kiw. All rights reserved.
//

import SwiftUI
import WorkoutDataKit

struct GenderPage: View {
    @State private var isMaleTapped: Bool = false
    @State private var isFemaleTapped: Bool = false
    @State private var showGenderSelectionWarning: Bool = false
//    @Binding var gender: String
    @Binding var selection: Int
    @EnvironmentObject var userDataStore: UserDataStore
    
    //    @Binding var isNextButtonEnabled: Bool
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Text("Gender")
                .font(.largeTitle)
                .fontWeight(.bold)
            //                .foregroundColor(Color(red: 0.98, green: 0.66, blue: 0.01))
                .foregroundColor(Color(.blue))
                .padding(.top)
            Spacer()
            Text("* Plase select your gender")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(showGenderSelectionWarning ? Color.red : Color.black) // เปลี่ยนสีของข้อความตามเงื่อนไข
                .padding(.bottom)
                .scaleEffect(showGenderSelectionWarning ? 1.1 : 1.0)
                .animation(.easeInOut)
            Spacer()
            Spacer()
            Spacer()
            
            VStack(spacing: 10) {
                Spacer()
                Spacer()
                Spacer()
                Button(action: {
                    self.isMaleTapped = true
                    self.isFemaleTapped = false
                    self.showGenderSelectionWarning = false
                    //                    self.gender = "Male"
                }) {
                    GenderSelectionCircle(label: "Male", isSelected: isMaleTapped)
                }
                
                Button(action: {
                    self.isFemaleTapped = true
                    self.isMaleTapped = false
                    self.showGenderSelectionWarning = false
                    //                    self.gender = "Male"
                    
                }) {
                    GenderSelectionCircle(label: "Female", isSelected: isFemaleTapped)
                    
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                //                NavigationLink(destination: NextPage(), isActive: $isMaleTapped) {
                //                Button(action: {
                ////                            isNextButtonEnabled = true  // อัปเดตตัวแปรที่ผูกมัดเมื่อปุ่มถูกกด
                //                    withAnimation {
                //                                           self.showGenderSelectionWarning = !(isMaleTapped || isFemaleTapped) // กำหนดให้แสดงการเตือนเมื่อยังไม่ได้เลือก
                //                                       }
                //                        })
                Button(action: nextButtonTapped)
                {
                    Text("Next")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(.blue))
                        .cornerRadius(10)
                        .padding(.bottom, 0)
                }
                
                //                NavigationLink(destination: NextPage(), isActive: $isFemaleTapped) {
                //                    EmptyView()
                //                }
                Spacer()
                Spacer()
                Spacer()
            }
            .offset(y: -40)
            .animation(.easeInOut)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 180/255, green: 180/255, blue: 180/255).edgesIgnoringSafeArea(.all))
    }
    func nextButtonTapped() {
        guard isMaleTapped || isFemaleTapped else {
            showGenderSelectionWarning = true
            return
        }
        
//        gender = isMaleTapped ? "Male" : "Female"
        userDataStore.userData.gender = isMaleTapped ? "Male" : "Female"
        // Set the selection state to 1 to navigate to agePage()
        selection = 1
    }
    
    struct GenderSelectionCircle: View {
        let label: String
        let isSelected: Bool
        
        var body: some View {
            Circle()
                .fill(isSelected ? Color(.blue) : Color(.gray)) //red: 44/255, green: 44/255, blue: 46/255
                .frame(width: 200, height: 200)
                .overlay(
                    Text(label)
                        .foregroundColor(isSelected ? .white : .white)
                        .fontWeight(.bold)
                        .font(.title)
                )
        }
    }
    
    //struct GenderPage_Preview: PreviewProvider {
    //    static var previews: some View {
    //        GenderPage()
    //    }
    //}
    struct GenderPage_Preview: PreviewProvider {
//        @State static var gender: String = ""
        @State static var selection: Int = 0 // Add selection state variable
        
        static var previews: some View {
            GenderPage( selection: $selection)
                .environmentObject(UserDataStore())
        }
    }
}
