//
//  SearchMenu.swift
//  Appgo
//
//  Created by Ingi Haraldss on 9.5.2024.
//

import Foundation
import SwiftUI
import MapKit
import UIKit


struct SearchMenu: View {
    @ObservedObject var locationViewModel = LocationManager()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Gestanet")
                        .bold()
                    + Text(" - Origo Gestir - Earthquake.Season")
                    
                    Image("ol")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    if locationViewModel.locations.isEmpty {
                        Text("Loading locations...")
                    } else {
                        locationMenu
                    }
                }
                .navigationTitle("Yfirlit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SearchPage()) {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                }
            }
        }
    }
    
    private var locationMenu: some View {
        // Uppsetning UI með tveimur flokkum
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            // undirsíður
            NavigationLink(destination: ViewControllerRepresentable()) {
                MenuItemView(title: "Myndavélaleit", imageName: "camera", color: .orange)
            }
            NavigationLink(destination: PrintersUI()) {
                MenuItemView(title: "Prentleit", imageName: "list.bullet.clipboard", color: .orange)
            }
            NavigationLink(destination: VerðlLeit()) {
                MenuItemView(title: "Verðsaga", imageName: "list.bullet.clipboard", color: .orange)
            }
            NavigationLink(destination: RicohSearcherView()) {
                MenuItemView(title: "Ricoh", imageName: "list.bullet.clipboard", color: .orange)
            }
        }
    }
}

