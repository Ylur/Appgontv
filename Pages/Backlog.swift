//
//  Backlog.swift
//  Appgo
//
//  Created by Ingi Haraldss on 7.5.2024.
//

import Foundation
import SwiftUI
import WebKit



struct Backlog: View {
    var body: some View {
        NavigationView {
            WebView(url: URL(string: "url hér")!)
                .navigationBarTitle("Backlog", displayMode: .inline)
        }
    }
}
