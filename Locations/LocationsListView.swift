//
//  LocationsListView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//
import Foundation
import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject var locationsRepository: LocationManager

    var body: some View {
        NavigationView {
            List(locationsRepository.locations, id: \.id) { location in
                NavigationLink(destination: LocationDetailView(location: location)) {
                    LocationCell(location: location)
                }
            }
            .navigationTitle("Staðsetningar")
        }
    }
}


