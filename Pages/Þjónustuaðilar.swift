//
//  Þjónustuaðilar.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import SwiftUI
import MapKit

// stillingar fyrir staðsetningar
struct LocationData: Identifiable, Decodable {
    var id: UUID
    var title: String
    var coordinate: CLLocationCoordinate2D
    var phoneNumber: String
    var address: String
    var companyName: String
    var email: String

    enum CodingKeys: String, CodingKey {
        case id, title, phoneNumber, address, companyName, email, latitude, longitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        address = try container.decode(String.self, forKey: .address)
        companyName = try container.decode(String.self, forKey: .companyName)
        email = try container.decode(String.self, forKey: .email)
        print("Decoded ID: \(id)")
    }
}



struct WorkShopView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Image("ol")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .cornerRadius(10)
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(locationManager.locations) { 
                            location in
                            NavigationLink(destination: LocationDetailView(location: location)) {
                                Text(location.title)
                            }
                        }
                    }
                    .navigationBarTitle("Þjónustuaðilar")
                }
            }
        }
    }
}
