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
    @Environment(\.managedObjectContext) var viewContext
    
    var body : some View {
        VStack {
            if mode?.wrappedValue == .active{
                HStack { //displaying and editing Title and saving it to FaveGames model
                    Text("✎")
                        .font(Font.system(.largeTitle).bold())
                        .foregroundColor(.black)
                    TextField("Enter text here", text: $game.boundTitle, onEditingChanged: {
                        _ in try? self.viewContext.save()
                    })
                        .font(Font.system(.largeTitle).bold())
                }
            }
            List { //displaying all games in stored array of Games
                ForEach(game.children, id: \.self)  { item in
                    NavigationLink(destination: DetailView(game: item)){
                        RowItem(rowGame: item)
                    }
                }.onDelete {
                        indices in self.game.removeFromGames(at: indices as NSIndexSet )
                        try? self.viewContext.save()
                    } //to delete the Game at current instance
                  .onMove {
                        (indices, destination) in self.game.children.move(fromOffsets: indices, toOffset: destination)
                        try? self.viewContext.save()
                    }
            }.frame(width: UIScreen.main.bounds.width-25)
        }.navigationBarTitle(mode?.wrappedValue == .active ? "" : game.title ?? "Favourite Games")
    }
}
