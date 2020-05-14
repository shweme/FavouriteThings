//
//  LocationExtension.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 13/5/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import CoreData
import CoreLocation
import MapKit

extension Location {
    
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
    
}
