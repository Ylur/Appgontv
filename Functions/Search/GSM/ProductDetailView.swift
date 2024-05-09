//
//  ProductDetailView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//
import SwiftUI



struct ProductDetailView: View {
    var phone: Phone
    
    var body: some View {
        VStack {
            Text("Name: \(phone.name)")
            Text("Brand: \(phone.brand)")
            Text("Price: $\(phone.price)")
        
        }
        .navigationTitle("Product Details")
    }
}

