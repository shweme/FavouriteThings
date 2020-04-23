//
//  FaveGames.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import Foundation

class FaveGames : ObservableObject, Identifiable, Codable {
    
    //pplArray stores an array of instances of class People
    @Published var games: [Games]
    @Published var title: String
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.url = try container.decode(String.self, forKey: .url)
//    }
    
    init() {
        title = "Favourite Things"
        games = [Games]()
    }
    
    enum CodingKeys: String, CodingKey {
        case games
        case title
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.games = try container.decode(Array<Games>.self, forKey: .games)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(games, forKey: .games)
    }
    
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
