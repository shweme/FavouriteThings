//
//  FaveGamesExtensions.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 30/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import CoreData

//allows CoreData optionals to be unwrapped for entity FaveGames
extension FaveGames {
    var boundTitle: String {
        get { title ?? "" }
        set { title = newValue }
    }
    
    var children: [Games] {
        get { games?.array as? [Games] ?? [] }
        set { games = NSOrderedSet(array: newValue) }
    }
}
