//
//  SearchPage.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import SwiftUI

struct SearchPage: View {
    @State private var searchResults: [Phone] = [] 
    
    var body: some View {
        NavigationView {
            List(searchResults, id: \.name) { phone in
                NavigationLink(destination: ProductDetailView(phone: phone)) {
                    Text(phone.name)
                }
            }
            .navigationTitle("Search Results")
        }
    }
}
