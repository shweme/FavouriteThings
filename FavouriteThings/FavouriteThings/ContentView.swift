//
//  ContentView.swift
//  FavouriteThings
//
//  This View creates a navigation bar and the add functionality.
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FaveGames.title, ascending: true)], animation: .default) var game: FetchedResults<FaveGames>

    var body: some View {
        NavigationView {
            MasterView(game: game.first ?? FaveGames(context: viewContext))
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button( //button to add a character
                        action: { //adding animation for when a character is added
                            withAnimation {
                                let new = Games(context: self.viewContext)
                                new.games = self.game.first
                                try? self.viewContext.save()
                            }
                    }
                    ) {Image(systemName: "plus")}
            )
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("Favourite Things")
                .navigationBarTitle(Text("Favourite Things"), displayMode: .automatic)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        Button(
                            action: { print("Adding a game") },
                            label: { Text("+").font(.largeTitle)}
                        )
                )
        }

    }
}
