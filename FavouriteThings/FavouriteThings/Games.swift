//
//  Games.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import Foundation
import SwiftUI

class Games : ObservableObject, Identifiable {
    
    @Published var url : String? //stores the url of the image user MIGHT want to download
    
    //img allows the entered url to be converted to an Image directly without
    //having to call imgDownload() everytime a picture needs to be displayed
    var img: Image {
        if let u = url {
            return imgDownload(u)
        } else {
            return Image("Default")
        }
    }
    
    //purely character related information for displaying, all stored as Strings
    @Published var name: String
    @Published var players : String
    @Published var playTime: String
    @Published var published: String
    @Published var skills: String
    @Published var notes: String
    @Published var field1: String
    @Published var field2: String
    @Published var field3: String
    @Published var field4: String
    
    
    //initialiser for all instance variables of the People class
    init(url: String?, name: String, players: String, playTime: String, published: String, skills: String, notes: String, field1: String, field2: String, field3: String, field4: String){
        self.url = url
        self.name = name
        self.players = players
        self.playTime = playTime
        self.published = published
        self.skills = skills
        self.notes = notes
        self.field1 = field1
        self.field2 = field2
        self.field3 = field3
        self.field4 = field4
    }
}

