//
//  Þjónustuaðilar.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import SwiftUI
import MapKit

struct WorkShopView: View {
    var title: String
    @EnvironmentObject var locationManager: LocationManager 

    var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(locationManager.locations, id: \.id) { location in
                        NavigationLink(destination: LocationDetailView(location: location)) {
                            LocationDetailView(location: location)
                        }
                    }
                }
                .navigationBarTitle("Þjónustuaðilar")
            }
        }
    }
}

