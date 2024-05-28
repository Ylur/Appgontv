//
//  Matur.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import SwiftUI
import WebKit



struct MaturView: View {
    var body: some View {
        NavigationView {
            WebView(url: URL(string: "https://origo.timian.is/public/5eaf1240197ea/meals/day")!)
                .navigationBarTitle("Matseðill", displayMode: .inline)
        }
    }
}

