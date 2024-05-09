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
            VStack(alignment: .leading, spacing: 10) {
                
                Image("ol")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        Text(location.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding([.leading, .bottom], 10),
                        alignment: .bottomLeading
                    )

                
                Group {
                    DetailRow(icon: "person.fill", title: "Nafn", detail: location.companyName)
                    DetailRow(icon: "phone.fill", title: "Sími", detail: location.phoneNumber)
                    DetailRow(icon: "map.fill", title: "Heimilisfang", detail: location.address)
                    DetailRow(icon: "envelope.fill", title: "Netfang", detail: location.email)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle("Yfirlit")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRow: View {
    var icon: String
    var title: String
    var detail: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
                .frame(width: 20)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.secondary)
                Text(detail)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .padding(.leading, 5)
        }
        .padding(.vertical, 5)
    }
}



