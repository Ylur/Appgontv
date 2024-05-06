//
//  LocationData.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import MapKit

struct LocationData: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
    let phoneNumber: String
    let address: String
    let companyName: String
    let email: String
}


