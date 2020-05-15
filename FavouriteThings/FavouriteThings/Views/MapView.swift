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
    @ObservedObject var location: Location
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = location
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        guard !location.isUpdating else {
            return
        }
        let latDouble = Double(self.location.boundLat)
        let longDouble = Double(self.location.boundLong)
        let target = CLLocationCoordinate2D(latitude: latDouble ?? 0, longitude: longDouble ?? 0)
        let region = MKCoordinateRegion(center: target, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)
    }
    
}

