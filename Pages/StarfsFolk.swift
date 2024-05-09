//
//  StarfsFolk.swift
//  Appgo
//
//  Created by Ingi Haraldss on 7.5.2024.
//

import Foundation
import SwiftUI
import WebKit



struct StarfsFolk: View {
    var body: some View {
        NavigationView {
            WebView(url: URL(string: "https://origo.starfsmenn.is")!)
                .navigationBarTitle("Starfsfólk", displayMode: .inline)
        }
    }
}
