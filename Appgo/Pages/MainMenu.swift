//  MainMenu.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
import SwiftUI
import UIKit

struct MainMenu: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Gestanet")
                        .bold()
                    + Text(" - Origo Gestir - Earthquake.Season")
                        .foregroundColor(.primary)  // dark eða lightmode
                    
                    Image("ol")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                    
                    locationMenu
                }
                .navigationTitle("Appgo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Skrá út") {
                            authViewModel.signOut()
                        }
                        .foregroundColor(.primary)  // dark eða light mode
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
            NavigationLink(destination: WorkShopView()) {
                MenuItemView(title: "Sími og staðsetningar", imageName: "map", color: .orange)
            }
            NavigationLink(destination: PortalView()) {
                MenuItemView(title: "Portal", imageName: "person.2", color: .orange)
            }
            NavigationLink(destination: StarfsFolk()) {
                MenuItemView(title: "Starfsfólk", imageName: "person", color: .orange)
            }
            NavigationLink(destination: VizitoView()) {
                MenuItemView(title: "Vizito", imageName: "calendar.circle", color: .orange)
            }
            NavigationLink(destination: FortuneWheelView()) {
                MenuItemView(title: "Lukkuhjól", imageName: "list.bullet.clipboard", color: .orange)
            }
            NavigationLink(destination: SearchMenu()) {
                MenuItemView(title: "Leitarflokkur", imageName: "mappin", color: .orange)
            }
        }
    }
}
