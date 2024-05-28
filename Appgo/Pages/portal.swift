//
//  portal.swift
//  Appgo
//
//  Created by Ingi Haraldss on 21.5.2024.
//

import Foundation
import SwiftUI
import WebKit



struct PortalView: View {
    var body: some View {
        NavigationView {
            WebView(url: URL(string: "https://my.origo.is/plugins/servlet/gateway?id=1#!/dashboard")!)
                .navigationBarTitle("Portal", displayMode: .inline)
        }
    }
}
