//
//  RowItem.swift
//  FavouriteThings
//
//  Populates every row in the list with details specific to the row
//  Name, image, and the number of people who can play the game.
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import SwiftUI

struct RowItem: View {
    @ObservedObject var rowGame: Games //contains instance of a singular character
    var body: some View {
        HStack {
            rowGame.img
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75, height: 75, alignment: .leading)
            Text(self.rowGame.name)
                .fontWeight(.medium)
                .frame(alignment: .leading)
            Spacer()
            Text(self.rowGame.players)
                .foregroundColor(Color.gray)
                .frame(alignment: .trailing)
        }
        .padding([.trailing])
    }
}

struct RowItem_Previews: PreviewProvider {
    static var previews: some View {
        RowItem(rowGame: Games(url: "Default", name: "Secret Hitler", players: "5 - 10 players", playTime: "30 - 60 minutes", published: "2018", skills: "Deception, strategy", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"))
    }
}
