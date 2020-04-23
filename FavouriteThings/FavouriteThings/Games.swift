//
//  Games.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import Foundation
import SwiftUI

class Games : ObservableObject, Identifiable, Codable {
    
    @Published var url : String? //stores the url of the image user MIGHT want to download
    
    var img: Image {
        if url == "Default"{
            return Image("Default")
        } else {
            return imgDownload(url ?? "")
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
    
    
    enum CodingKeys: String, CodingKey {
        case url
        case name
        case players
        case playTime
        case published
        case skills
        case notes
        case field1
        case field2
        case field3
        case field4
    }
    
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.name = try container.decode(String.self, forKey: .name)
        self.players = try container.decode(String.self, forKey: .players)
        self.playTime = try container.decode(String.self, forKey: .playTime)
        self.published = try container.decode(String.self, forKey: .published)
        self.skills = try container.decode(String.self, forKey: .skills)
        self.notes = try container.decode(String.self, forKey: .notes)
        self.field1 = try container.decode(String.self, forKey: .field1)
        self.field2 = try container.decode(String.self, forKey: .field2)
        self.field3 = try container.decode(String.self, forKey: .field3)
        self.field4 = try container.decode(String.self, forKey: .field4)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(url, forKey: .url)
        try container.encode(name, forKey: .name)
        try container.encode(players, forKey: .players)
        try container.encode(playTime, forKey: .playTime)
        try container.encode(published, forKey: .published)
        try container.encode(skills, forKey: .skills)
        try container.encode(notes, forKey: .notes)
        try container.encode(field1, forKey: .field1)
        try container.encode(field2, forKey: .field2)
        try container.encode(field3, forKey: .field3)
        try container.encode(field4, forKey: .field4)
    }
    
}

