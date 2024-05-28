//
//  LocationsMenuView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import SwiftUI
import MapKit

struct LocationsMenuView: View {
    @EnvironmentObject var locationsRepository: LocationManager
    var title: String

    var body: some View {
        NavigationView {
            List(locationsRepository.locations, id: \.id) { location in
                VStack(alignment: .leading) {
                    Text(location.title).font(.headline)
                    Text("Company: \(location.companyName)")
                    Text("Phone: \(location.phoneNumber)")
                    Text("Address: \(location.address)")
                }
            }
            .navigationBarTitle(Text(title))
        }
    }
}


