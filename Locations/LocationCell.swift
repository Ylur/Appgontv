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
        VStack(alignment: .leading) {
            Text(location.title).font(.headline)
            Text("Phone: \(location.phoneNumber)")
            Text("Address: \(location.address)")
        }
    }
}
