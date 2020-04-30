//
//  GamesExtension.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 30/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import CoreData

extension Games {
    var boundName: String {
        get { name ?? "" }
        set { name = newValue }
    }
    
    var boundPlayers: String {
        get { players ?? "" }
        set { players = newValue }
    }
    
    var boundPlayTime: String {
        get { playTime ?? "" }
        set { playTime = newValue }
    }
    
    var boundPublished: String {
        get { published ?? "" }
        set { published = newValue }
    }
    
    var boundSkills: String {
        get { skills ?? "" }
        set { skills = newValue }
    }
    
    var boundNotes: String {
        get { notes ?? "" }
        set { notes = newValue }
    }
    
    var boundField1: String {
        get { field1 ?? "" }
        set { field1 = newValue }
    }
    
    var boundField2: String {
        get { field2 ?? "" }
        set { field2 = newValue }
    }
    
    var boundField3: String {
        get { field3 ?? "" }
        set { field3 = newValue }
    }
    
    var boundField4: String {
        get { field4 ?? "" }
        set { field4 = newValue }
    }
    
    
}
