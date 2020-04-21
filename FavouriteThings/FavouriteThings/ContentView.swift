//
//  ContentView.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var game: FaveGames
    @State private var title: String = "Favourite things"
    var body: some View {
        NavigationView {
            MasterView(game: game, title: $title)
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button( //button to add a character
                        action: { //adding animation for when a character is added
                            withAnimation { self.game.add(Games(url: "Default", name: "", players: "", playTime: "", published: "", skills: "", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required")); print(self.game)
                                //Event.create(in: self.viewContext)
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
