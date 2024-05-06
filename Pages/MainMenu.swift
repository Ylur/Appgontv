//
//  MainMenu.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import SwiftUI
import MapKit


struct MainMenu: View {
    @ObservedObject var locationViewModel = LocationManager()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
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
                .navigationTitle("Appgo")
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
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            NavigationLink(destination: MaturView()) {
                MenuItemView(title: "Matseðill", imageName: "fork.knife.circle", color: .orange)
            }
            NavigationLink(destination: WorkShopView(title: "Staðsetningar")) {
                MenuItemView(title: "Sími og staðsetningar", imageName: "map", color: .blue)
            }
            NavigationLink(destination: MapsView()) {
                MenuItemView(title: "Kort", imageName: "map", color: .blue)
            }
            NavigationLink(destination: WorkShopView(title: "Staðsetningar")) {
                MenuItemView(title: "Sími og staðsetningar", imageName: "map", color: .blue)
            }
        }
    }
}
