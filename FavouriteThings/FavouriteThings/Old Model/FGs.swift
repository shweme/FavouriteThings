//
//  FaveGames.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

//MARK: No longer used

/*

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
        title = "Favourite Games"
        games = [Games(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrN8urwpwCWMwTmeU9xLhMmYVkwXA04GQPZxNLh6DGikLasv_n&usqp=CAU", name: "Settlers of Catan", players: "3 - 4", playTime: "90 - 120 minutes", published: "1995", skills: "Strategy, negotiation", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"), Games(url: "https://contestimg.wish.com/api/webimage/5be12829febb6831319763fb-large.jpg?cache_buster=884fa7d14cdb857bda250f549e82ad24", name: "Unstable Unicorns", players: "2 - 8", playTime: "30 - 45 minutes", published: "2018", skills: "Strategy", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"), Games(url: "https://cf.geekdo-images.com/imagepage/img/lLzsghVIr1cEC6Dii4_GA0ySWpQ=/fit-in/900x600/filters:no_upscale()/pic5164305.jpg", name: "Secret Hitler", players: "5 - 10", playTime: "30 - 60 minutes", published: "2018", skills: "Deception, strategy", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required")]
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
*/
