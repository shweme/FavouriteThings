//
//  LocationView.swift
//  FavouriteThings
//
//  This view contains a map of the location as well as the address, longitude and latitude
//
//  Created by Shweta Mehta on 13/5/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import CoreLocation
import SwiftUI

struct LocationView: View {
    @ObservedObject var location: Location
    @Environment(\.managedObjectContext) var viewContext
    @State var currentPosition = CLLocationCoordinate2D()
    var body: some View {
        VStack {
            
            //displays map
            MapView(location: location)
                .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .top)
            HStack (alignment: .top){
                
                //displays address
                Text("Name")
                TextField("Enter location name", text: self.$location.boundName, onEditingChanged: { _ in try? self.viewContext.save() }, onCommit: {
                    //auto-update map, longitude, and latitude when address is updated
                    let geoCoder = CLGeocoder()
                    let region =  CLCircularRegion(center: self.currentPosition, radius: 2_000_000, identifier: "\(self.currentPosition)")
                    geoCoder.geocodeAddressString(self.location.boundName, in: region) { (placemarks, error) in
                        guard let locate = placemarks?.first?.location else {
                            print("Error locating '\(self.location.locationName)': \(error.map {"\($0)"} ?? "<unknown errror>")")
                            return
                        }
                        let position = locate.coordinate
                        self.currentPosition.latitude = position.latitude
                        self.currentPosition.longitude = position.longitude
                        self.location.boundLat = "\(position.latitude)"
                        self.location.boundLong = "\(position.longitude)"
                    }
                })
            }
            
            HStack {
                
                //display latitude of location
                Text("Latitude:")
                TextField("Location Name", text: self.$location.boundLat, onEditingChanged: { _ in try? self.viewContext.save() }, onCommit: {
                    
                    //auto-update map, address, and longitude when address is updated
                    guard let latitude = CLLocationDegrees(self.location.boundLat), let longitude = CLLocationDegrees(self.location.boundLong) else {
                        print("Coordinates Invalid")
                        return
                    }
                    self.currentPosition.latitude = latitude
                    self.currentPosition.longitude = longitude
                    let geoCoder = CLGeocoder()
                    let pos = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)
                    geoCoder.reverseGeocodeLocation(pos) { (placemarks, error) in
                        guard let placemark = placemarks?.first else {
                            print("Error locating \(self.currentPosition.latitude) / \(self.currentPosition.longitude): \(error.map {"\($0)"} ?? "<unknown error>")")
                            return
                        }
                        self.location.boundName = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                    }
                })
            }
            
            HStack {
                
                //display longitude of location
                Text("Longitude:")
                TextField("Location Name", text: self.$location.boundLong, onEditingChanged: { _ in try? self.viewContext.save() }, onCommit: {
                    
                    //auto-update map, address, and latitude when address is updated
                    guard let latitude = CLLocationDegrees(self.location.boundLat), let longitude = CLLocationDegrees(self.location.boundLong) else {
                        print("Coordinates Invalid")
                        return
                    }
                    self.currentPosition.latitude = latitude
                    self.currentPosition.longitude = longitude
                    let geoCoder = CLGeocoder()
                    let pos = CLLocation(latitude: self.currentPosition.latitude, longitude: self.currentPosition.longitude)
                    geoCoder.reverseGeocodeLocation(pos) { (placemarks, error) in
                        guard let placemark = placemarks?.first else {
                            print("Error locating \(self.currentPosition.latitude) / \(self.currentPosition.longitude): \(error.map {"\($0)"} ?? "<unknown error>")")
                            return
                        }
                        self.location.boundName = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                    }
                })
            }
            Spacer()
        }
    }
}
