//
//  NamePage.swift
//  Iron
//
//  Created by Akaradach Choeychusri on 7/4/2567 BE.
//  Copyright © 2567 BE Kiw. All rights reserved.
//

import SwiftUI

class UserAuthentication: ObservableObject {
    var username = "" {
        willSet {
            objectWillChange.send()
        }
    }
}

struct NamePage: View {
    @State private var name: String = ""
    @StateObject var user = UserAuthentication()
    @State private var isNextButtonTapped = false // เพิ่ม state เพื่อตรวจสอบว่าปุ่ม Next ถูกกดหรือไม่

    var body: some View {
        NavigationView {
            VStack {
                Text("Name")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(Color(.blue))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.top)
                Text("*Plase select your name")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(name.isEmpty && isNextButtonTapped ? Color.red : Color.black) // เช็คค่า TextField และปุ่ม Next
                    .padding(.bottom)
                    .scaleEffect(name.isEmpty && isNextButtonTapped ? 1.1 : 1.0) // ให้ข้อความมีการ Scale ตามเงื่อนไข
                    .animation(.easeInOut) // เพิ่ม animation

                Spacer()

                VStack {
                    Rectangle()
                        .fill(Color(.blue))
                        .frame(width: 300, height: 1.69)
                    TextField("Your Name", text: $name)
//                    TextField("Your Name", text: $user.username)
                        .frame(width: 300)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(Color(.blue))
                        .font(.title2)
                        .padding()
                        .cornerRadius(20)

                    Rectangle()
                        .fill(Color(.blue))
                        .frame(width: 300, height: 1.69)
                }
                .padding(.horizontal, 20)

                Spacer()

                Button(action: {
                    // Set the state of isNextButtonTapped to true when Next is tapped
                    isNextButtonTapped = true
                    // Navigate to the next page here
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.blue))
                        .cornerRadius(12)
                        .padding(.horizontal, 24)
                        .offset(y: -10)
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 180/255, green: 180/255, blue: 180/255).edgesIgnoringSafeArea(.all))
//            .navigationBarHidden(true) // ซ่อน Navigation Bar
        }
    }
}

struct NamePage_Previews: PreviewProvider {
    static var previews: some View {
        NamePage()
    }
}
