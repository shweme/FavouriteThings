//
//  MapView.swift
//  FavouriteThings
//
//  This View is for diplaying the map and auto-updating map when coordinate are changed.
//
//  Created by Shweta Mehta on 14/5/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapView: UIViewRepresentable {
    @ObservedObject var location: Games
    @ObservedObject var locdel: LocationDelegate
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = locdel
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
//        guard !locdel.isUpdating else { return }
        
        let target = CLLocationCoordinate2D(latitude: Double(self.location.locLat) ?? 0, longitude: Double(self.location.locLong) ?? 0)
        let region = MKCoordinateRegion(center: target, latitudinalMeters: 5_000, longitudinalMeters: 5_000)
        mapView.setRegion(region, animated: true)
    }
}

