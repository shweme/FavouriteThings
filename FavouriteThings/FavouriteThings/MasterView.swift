//
//  MasterView.swift
//  FavouriteThings
//
//  This view creates the delete an move functionality for the app,
//  as well as puts the details in a list.
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var game : FaveGames
    @Environment(\.editMode) var mode
    var body : some View {
        VStack {
            if mode?.wrappedValue == .active{
                HStack {
                    Text("✎")
                        .font(Font.system(.largeTitle).bold())
                        .foregroundColor(.black)
                    TextField("Enter text here", text: $game.title)
                        .font(Font.system(.largeTitle).bold())
                }
            }
            List {
                ForEach(game.games)  { item in
                    NavigationLink(destination: DetailView(game: item)){
                        RowItem(rowGame: item)
                    }
                }.onDelete {indices in self.game.remove(indices)} //to delete the Person at current instance
                    .onMove { (indices, destination) in self.game.games.move(fromOffsets: indices, toOffset: destination) }
            }.frame(width: UIScreen.main.bounds.width-25)
        }.navigationBarTitle(mode?.wrappedValue == .active ? "" : game.title)
        
    }
}


//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        MasterView(game: get_faves(), title: "Favourite Things")
//    }
//}

//dummy data for the preview
func get_faves() -> FaveGames {
    let faves: FaveGames = FaveGames()
    
    faves.add(Games(url: "Default", name: "Settlers of Catan", players: "3 - 4 ", playTime: "90 - 120 minutes", published: "1995", skills: "Strategy, negotiation", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"))
    
    faves.add(Games(url: "Default", name: "Secret Hitler", players: "5 - 10 players", playTime: "30 - 60 minutes", published: "2018", skills: "Deception, strategy", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"))
    
    return faves
}
