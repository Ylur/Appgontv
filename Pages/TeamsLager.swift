//
//  TeamsLager.swift
//  Appgo
//
//  Created by Ingi Haraldss on 7.5.2024.
//

import Foundation
import SwiftUI
import WebKit



struct TeamsLager: View {
    var body: some View {
        NavigationView {
            WebView(url: URL(string: "https://teams.microsoft.com/l/channel/19%3a8112ac2630b24bf9aca9df16e0f5db69%40thread.skype/Innkaup%2520-%2520v%25C3%25A6ntanlegt%2520%25C3%25A1%2520lager?groupId=a014ead3-f6d4-4979-a5ad-e4cbc08de59f&tenantId=470852d5-78e3-4ee3-bee9-e9638b276d14")!)
                .navigationBarTitle("Teams", displayMode: .inline)
        }
    }
}
