//
//  MapView.swift
//  FavouriteThings
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
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        let latDouble = Double(self.location.boundLat)
        let longDouble = Double(self.location.boundLong)
        let target = CLLocationCoordinate2D(latitude: latDouble ?? 0, longitude: longDouble ?? 0)
        let region = MKCoordinateRegion(center: target, latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: true)
    }
}

