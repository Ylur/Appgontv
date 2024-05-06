//
//  MapView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 5.5.2024.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region: MKCoordinateRegion

    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        _region = State(initialValue: MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    }

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

