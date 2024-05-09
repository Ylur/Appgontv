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
            WebView(url: URL(string: "https://veita2.focal.is/users/palmi/BackLog2020.nsf/index.xsp")!)
                .navigationBarTitle("Backlog", displayMode: .inline)
        }
    }
}
