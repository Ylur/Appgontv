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
                    .foregroundColor(Color("DynamicTitleColor"))
                
                Image("ol") 
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)

                Group {
                    DetailRow(title: "Sími", detail: location.phoneNumber)
                    DetailRow(title: "Heimilisfang", detail: location.address)
                    DetailRow(title: "Fyrirtæki", detail: location.companyName)
                    DetailRow(title: "Netfang", detail: location.email)
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
            // sími,heimilisfang etc
            Text(title)
                .font(.headline)
                .foregroundColor(Color("DynamicTitleColor"))
            //infoið
            Text(detail)
                .font(.subheadline)
                .foregroundColor(Color("DynamicTitleColor"))
            Divider()
        }
    }
}



