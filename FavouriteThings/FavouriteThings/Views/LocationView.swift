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
    @ObservedObject var location: Games
    @ObservedObject var keyboard = Keyboard()
    @Environment(\.managedObjectContext) var viewContext
    @State var currentPosition = CLLocationCoordinate2D()
    
    // Holding location info in temp variables to avoid map auto-centre before user commits changes.
    @State var tName: String
    @State var tLat: String
    @State var tLong: String
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                    
                    //displays map
                MapView(location: location, locdel: LocationDelegate(game: location))
                        .frame(width:UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .top)
                    HStack (alignment: .top){
                        
                        //displays address
                        Text("Address:")
                        TextField("Enter address of location", text: self.$tName, onCommit: {
                            //auto-update map, longitude, and latitude when address is updated
                            let geoCoder = CLGeocoder()
                            let region =  CLCircularRegion(center: self.currentPosition, radius: 2_000_000, identifier: "\(self.currentPosition)")
                            geoCoder.geocodeAddressString(self.tName, in: region) { (placemarks, error) in
                                guard let locate = placemarks?.first?.location else {
                                    print("Error locating '\(self.tName)': \(error.map {"\($0)"} ?? "<unknown errror>")")
                                    return
                                }
                                let position = locate.coordinate
                                self.currentPosition.latitude = position.latitude
                                self.currentPosition.longitude = position.longitude
                                self.location.locLat = "\(position.latitude)"
                                self.tLat = self.location.locLat
                                self.location.locLong = "\(position.longitude)"
                                self.tLong = self.location.locLong
                                self.location.locName = self.tName
                            }
                            try? self.viewContext.save()
                        })
                    }
                    
                    HStack {
                        
                        //display latitude of location
                        Text("Latitude:")
                        TextField("Latitudinal coordinate", text: self.$tLat, onEditingChanged: { _ in try? self.viewContext.save() }, onCommit: {
                            
                            //auto-update map and address when latitude is updated
                            guard let latitude = CLLocationDegrees(self.tLat), let longitude = CLLocationDegrees(self.tLong) else {
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
                                self.location.locName = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                                self.tName = self.location.locName
                                self.location.locLat = self.tLat
                                self.location.locLong = self.tLong
                            }
                        })
                    }
                    
                    HStack {
                        
                        //display longitude of location
                        Text("Longitude:")
                        TextField("Longitudinal coordinate", text: self.$tLong, onEditingChanged: { _ in try? self.viewContext.save() }, onCommit: {
                            
                            //auto-update map and address when longitude is updated
                            guard let latitude = CLLocationDegrees(self.tLat), let longitude = CLLocationDegrees(self.tLong) else {
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
                                self.location.locName = placemark.name ?? placemark.locality ?? placemark.subLocality ?? placemark.administrativeArea ?? placemark.country ?? "<unknown>"
                                self.tName = self.location.locName
                                self.location.locLat = self.tLat
                                self.location.locLong = self.tLong
                            }
                        })
                    }
                    Spacer()
                }
            }.offset(x: 0, y: CGFloat(-(keyboard.h + 50)))
        }
}
