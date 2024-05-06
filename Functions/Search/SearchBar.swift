//
//  Sear.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var searchAction: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text, onCommit: searchAction)
                .padding(.horizontal)
            Button(action: searchAction) {
                Image(systemName: "magnifyingglass")
            }
            .padding(.trailing)
        }
        .padding(.vertical)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

