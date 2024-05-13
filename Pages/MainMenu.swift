//  MainMenu.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
import SwiftUI
import UIKit

  
    // bæta við seinna
    //Button("Log Out") {
    //viewModel.logOut() }


    struct MainMenu: View {
        
        
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
                        
                        locationMenu
                    }
                    .navigationTitle("Appgo")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        
        private var locationMenu: some View {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
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
                //Button("Log Out") {
                    //viewModel.logOut()
                //}
            }
        }
    }
