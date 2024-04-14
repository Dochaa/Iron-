//
//  File.swift
//  Iron
//
//  Created by Akaradach Choeychusri on 12/4/2567 BE.
//  Copyright © 2567 BE Kiw. All rights reserved.
//

import SwiftUI
import SafariServices

struct YouTubeView: View {
    var body: some View {
        Button("Watch Video") {
            guard let url = URL(string: "https://www.youtube.com/watch?v=XstIT_dY6eE") else { return }
            UIApplication.shared.open(url)
        }
    }
}

