//
//  LocationManager.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import Foundation

class LocationManager: ObservableObject {
    @Published var locations: [LocationData] = []

    init() {
        loadLocations()
    }

    private func loadLocations() {
        // ath hvort appið sé að sækja
        print("Loading locations...")
        // á að sækja héðan
        guard let url = Bundle.main.url(forResource: "locations", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to load locations.json from bundle.")
            return
        }

        let decoder = JSONDecoder()
        do {
            locations = try decoder.decode([LocationData].self, from: data)
            print("Locations loaded successfully: \(locations.count)")
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
