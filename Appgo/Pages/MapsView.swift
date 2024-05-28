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
    @ObservedObject var locationViewModel = LocationManager()
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        
        let visitorCenterAnnotation = MKPointAnnotation()
        visitorCenterAnnotation.coordinate = CLLocationCoordinate2D(latitude: 64.1468308, longitude: -21.8960467)
        visitorCenterAnnotation.title = "Reykjavík"
        visitorCenterAnnotation.subtitle = "Borgartún"
        mapView.addAnnotation(visitorCenterAnnotation)
        
        
        let parkingLotPoints = [
            MKMapPoint(CLLocationCoordinate2D(latitude: 64.1468308, longitude: -21.8960467)), // Top left corner
            MKMapPoint(CLLocationCoordinate2D(latitude: 64.1468308, longitude: -21.8960467)), // Top right corner
            MKMapPoint(CLLocationCoordinate2D(latitude: 64.1468308, longitude: -21.8960467)), // Bottom right corner
            MKMapPoint(CLLocationCoordinate2D(latitude: 64.1468308, longitude: -21.8960467))  // Bottom left corner
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






