//
//  SlidePageFirstView.swift
//  Iron
//
//  Created by Akaradach Choeychusri on 7/4/2567 BE.
//  Copyright © 2567 BE Kiw. All rights reserved.
//

import SwiftUI

struct SlidePageFirstView: View {
    @State private var selection = 0
    @State private var gender: String = ""
    @Binding var userOnboarded: Bool
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                GenderPage( selection: $selection)
                    .tag(0)
                
                agePage()
                    .tag(1)

                NamePage()
                    .tag(2)
                
                WeightAndTallView()
                    .tag(3)
                
                BodyProportionsView(userOnboarded: $userOnboarded)
                    .tag(4)
                
            }
            .tabViewStyle(PageTabViewStyle())
            .accentColor(.blue)

        }
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 1, green: 1, blue: 1).edgesIgnoringSafeArea(.all))
    }
}

struct SlidePageFirstView_Previews: PreviewProvider {
    @State static var userOnboarded = false
    static var previews: some View {
                   SlidePageFirstView(userOnboarded: .constant(false))
                       .environmentObject(UserDataStore())
           }
       }
