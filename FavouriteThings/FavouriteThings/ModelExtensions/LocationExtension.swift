//
//  LocationExtension.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 13/5/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation
import MapKit

//allows core data optionals to be unwrapped for entity Location
extension Location: MKMapViewDelegate {
    
    var boundName: String {
        get { locationName ?? "" }
        set { locationName = newValue }
    }
    
    var boundLat: String {
        get { latitudeString ?? "" }
        set { latitudeString = newValue }
    }
    
    var boundLong: String {
        get { longitudeString ?? "" }
        set { longitudeString = newValue }
    }
    
    func mapViewDiDChangeVisibleRegion(_ mapView: MKMapView) {
        guard !isUpdating else {
            return
        }
        isUpdating = true
        let centre = mapView.centerCoordinate
        boundLat = String(centre.latitude)
        boundLong = String(centre.longitude)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .milliseconds(250)) {
            self.isUpdating = false
        }
        
    }
    
}
