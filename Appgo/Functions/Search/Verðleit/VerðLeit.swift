//
//  VerðlLeit.swift
//  Appgo
//
//  Created by Ingi Haraldss on 10.5.2024.
//

import Foundation
import SwiftUI
import WebKit



struct VerðLeit: View {
    var body: some View {
        NavigationView {
            WebView(url: URL(string: "https://prices.geimvera.com")!)
                .navigationBarTitle("Verðbreyting", displayMode: .inline)
        }
    }
}
