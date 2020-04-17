//
//  DetailView.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var game: Games //singular instance of People containing data of character
    @State var tUrl: String = "" //temporary variable to hold user-entered URL
    
    var body: some View {
        ScrollView(.vertical){ //To enable scrolling on portrait and landscape orientation
            VStack() {
                //Image display and edit field
                TextField("Enter url to load picture", text: $tUrl, onCommit: {
                    self.game.url = self.tUrl
                })//binding placeholder text to retain changes through navigation
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.gray)
                game.img
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350, alignment: .center)
                    .multilineTextAlignment(.center)

                TextField("Game's name", text: $game.name)
                    .font(Font.system(.largeTitle).bold())
                    .multilineTextAlignment(.center)
                
                
                HStack { //contains fixed field nation and referenced field native home of character
                    TextField("Field type", text: $game.field1)
                        .frame(width: 120)
                    TextField("Field information", text: $game.players)//binding placeholder text to retain changes through navigation
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack { //contains fixed field powers and referenced field powers of character
                    TextField("Field type", text: $game.field2)
                        .frame(width: 120)
                    TextField("Field information", text: $game.playTime)//binding placeholder text to retain changes through navigation
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack { //contains fixed field voiced by and referenced field name of character's voice actor
                    TextField("Field type", text: $game.field3)
                        .frame(width: 120)
                    TextField("Field information", text: $game.published)//binding placeholder text to retain changes through navigation
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack { //contains fixed field voiced by and referenced field name of character's voice actor
                    TextField("Field type", text: $game.field4)
                        .frame(width: 120)
                    TextField("Field information", text: $game.skills)//binding placeholder text to retain changes through navigation
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Spacer(minLength: 25)
                Text("Notes:\t\t")
                    .font(.body)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                TextField("Insert text here", text: $game.notes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } .frame(width: UIScreen.main.bounds.width-50, alignment: .center )
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(game: Games(url: "Default", name: "Secret Hitler", players: "5 - 10", playTime: "30 - 60 minutes", published: "2018", skills: "Deception, strategy", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"))
    }
}
