//
//  LocationDetailView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import SwiftUI

struct LocationDetailView: View {
    var location: LocationData

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(location.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text("Nafn: \(location.companyName)")
                    .font(.headline)
                Text("Sími: \(location.phoneNumber)")
                    .font(.headline)
                Text("Heimilisfang: \(location.address)")
                    .font(.headline)
                Text("Netfang: \(location.email)")
                    .font(.headline)
                
                
            }
            .padding()
        }
        .navigationTitle("Yfirlit")
        .navigationBarTitleDisplayMode(.inline)
    }
}


