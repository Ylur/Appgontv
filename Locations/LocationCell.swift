//
//  LocationCell.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import SwiftUI

struct LocationCell: View {
    var location: LocationData

    var body: some View {
        HStack {
            Image(systemName: "location.circle.fill")
                .foregroundColor(.blue)
                .imageScale(.large)
            VStack(alignment: .leading) {
                Text(location.title).font(.headline)
                Text("Phone: \(location.phoneNumber)")
                Text("Address: \(location.address)")
            }
        }
        .padding()
    }
}
