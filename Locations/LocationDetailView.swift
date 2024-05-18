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
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Image("ol") 
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)

                Group {
                    DetailRow(title: "Phone", detail: location.phoneNumber)
                    DetailRow(title: "Address", detail: location.address)
                    DetailRow(title: "Company", detail: location.companyName)
                    DetailRow(title: "Email", detail: location.email)
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle(location.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRow: View {
    var title: String
    var detail: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
            Text(detail)
                .font(.subheadline)
                .foregroundColor(.primary)
            Divider()
        }
    }
}



