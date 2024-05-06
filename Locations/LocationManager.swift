//
//  LocationManager.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import Foundation
import SwiftUI
import MapKit
import Combine

class LocationManager: ObservableObject {
    @Published var locations: [LocationData] = []

    init() {
        loadLocations()
    }

    func loadLocations() {
        
        locations = [
            LocationData(title: "Akureyri", coordinate: CLLocationCoordinate2D(latitude: 65.6814, longitude: -18.0895), phoneNumber: "516-1300", address: "Hvannavellir 14, 2hæð", companyName: "Origo", email: "sala@origo.is"),
            LocationData(title: "Eldhaf Akureyri", coordinate: CLLocationCoordinate2D(latitude: 65.6814, longitude: -18.0895), phoneNumber: "537-9999", address: "Glerártorg", companyName: "Verslun Eldhaf", email: "sala@origo.is"),
            LocationData(title: "Hornafjörður", coordinate: CLLocationCoordinate2D(latitude: 65.2666, longitude: -14.3948), phoneNumber: "478-2393", address: "Hafnarbraut 24", companyName: "Origo", email: "sala@origo.is"),
            LocationData(title: "Hvammstangi", coordinate: CLLocationCoordinate2D(latitude: 64.1353, longitude: -21.8952), phoneNumber: "455-2511/451-2260", address: "Höfðabraut 6", companyName: "Origo", email: "sala@origo.is"),
            LocationData(title: "Reykjavík", coordinate: CLLocationCoordinate2D(latitude: 64.1420, longitude: -21.9158), phoneNumber: "516-1900", address: "Köllunarklettsvegur 8", companyName: "Origo", email: "sala@origo.is"),
            LocationData(title: "Reykjavík", coordinate: CLLocationCoordinate2D(latitude: 64.1420, longitude: -21.9158), phoneNumber: "516-1900", address: "Faxafen 12", companyName: "Sónn", email: "sala@origo.is"),
            LocationData(title: "Egilsstaðir", coordinate: CLLocationCoordinate2D(latitude: 64.1420, longitude: -21.9158), phoneNumber: "516-1900", address: "Miðás 1", companyName: "Origo", email: "sala@origo.is"),
            LocationData(title: "Neskaupstaður", coordinate: CLLocationCoordinate2D(latitude: 64.1420, longitude: -21.9158), phoneNumber: "516-1900", address: "Nesgata 7", companyName: "Origo", email: "sala@origo.is"),
            LocationData(title: "Ísafjörður", coordinate: CLLocationCoordinate2D(latitude: 64.1420, longitude: -21.9158), phoneNumber: "516-1900", address: "Hafnarstræti 6", companyName: "Origo", email: "sala@origo.is")
        ]
    }
}
