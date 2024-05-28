//
//  portal.swift
//  Appgo
//
//  Created by Ingi Haraldss on 21.5.2024.
//

import Foundation
import SwiftUI
import WebKit



struct VizitoView: View {
    var body: some View {
        NavigationView {
            WebView(url: URL(string: "https://backoffice.vizito.be/#/page/login")!)
                .navigationBarTitle("Vizito", displayMode: .inline)
        }
    }
}
