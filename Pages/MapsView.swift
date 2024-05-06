//
//  MapsView.swift
//  Appgo
//
//  Created by Ingi Haraldss on 6.5.2024.
//

import Foundation
import SwiftUI
import MapKit


struct MapsView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Create an annotation
        let visitorCenterAnnotation = MKPointAnnotation()
        visitorCenterAnnotation.coordinate = CLLocationCoordinate2D(latitude: 64.1446, longitude: -21.9152)
        visitorCenterAnnotation.title = "Reykjavík"
        visitorCenterAnnotation.subtitle = "Borgartún"
        mapView.addAnnotation(visitorCenterAnnotation)
        
        // Create an overlay
        let parkingLotPoints = [
            MKMapPoint(CLLocationCoordinate2D(latitude: 64.1446, longitude: -21.9152)), // Top left corner
            MKMapPoint(CLLocationCoordinate2D(latitude: 64.1446, longitude: -21.9149)), // Top right corner
            MKMapPoint(CLLocationCoordinate2D(latitude: 64.1443, longitude: -21.9149)), // Bottom right corner
            MKMapPoint(CLLocationCoordinate2D(latitude: 64.1443, longitude: -21.9152))  // Bottom left corner
        ]
        
        let parkingLotOverlay = MKPolygon(points: parkingLotPoints, count: parkingLotPoints.count)
        mapView.addOverlay(parkingLotOverlay)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let overlay = overlay as? MKPolygon {
                let polygonRenderer = MKPolygonRenderer(overlay: overlay)
                polygonRenderer.fillColor = UIColor(white: 0.5, alpha: 0.5)
                return polygonRenderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}






