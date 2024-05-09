//
//  MainMenu.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import SwiftUI
import MapKit
import UIKit


struct MainMenu: View {
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
        // tvær raðir niður á við
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
            // undirsíður
            NavigationLink(destination: MaturView()) {
                MenuItemView(title: "Matseðill", imageName: "fork.knife.circle", color: .orange)
            }
            NavigationLink(destination: WorkShopView(title: "Staðsetningar")) {
                MenuItemView(title: "Sími og staðsetningar", imageName: "map", color: .orange)
            }
            NavigationLink(destination: SearchMenu()) {
                MenuItemView(title: "Leitarflokkur", imageName: "mappin", color: .orange)
            }
            NavigationLink(destination: StarfsFolk()) {
                MenuItemView(title: "Starfsfólk", imageName: "person", color: .orange)
            }
            NavigationLink(destination: WheelView()) {
                MenuItemView(title: "Lukkuhjól", imageName: "list.bullet.clipboard", color: .orange)
            }
            NavigationLink(destination: MapsView()) {
                MenuItemView(title: "Kort", imageName: "mappin", color: .orange)
            }

        }
    }
}
