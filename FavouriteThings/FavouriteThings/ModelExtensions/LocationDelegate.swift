//
//  LocationDelegate.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 15/5/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import Foundation
import MapKit

class LocationDelegate: NSObject, Identifiable, ObservableObject, MKMapViewDelegate {
    @Published var isUpdating: Bool = false
    @Published var location: Games
    
    init(game: Games) {
        self.location = game
    }
    
//    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//        guard !isUpdating else { return }
//        isUpdating = true
//        let centre = mapView.centerCoordinate
//        location.locLat = "\(centre.latitude)"
//        location.locLong = "\(centre.longitude)"
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(250)) {
//            self.isUpdating = false
//        }
//    }
    
}
