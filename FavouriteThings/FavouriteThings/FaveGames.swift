//
//  FaveGames.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import Foundation

class FaveGames : ObservableObject, Identifiable{
    
    //pplArray stores an array of instances of class People
    @Published var games = [Games]()
    
    //this function inserts the supplied member into the pplArray
    func add(_ add : Games) {
        self.games.insert(add, at: 0)
    }
    
    //this function deletes the member at given index from pplArray
    func remove(_ indexsets : IndexSet) {
        self.games.remove(atOffsets: indexsets)
        print(games)
    }
}
