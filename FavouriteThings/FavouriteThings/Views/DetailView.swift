//
//  DetailView.swift
//  FavouriteThings
//
//  This view is created when the user clicks on a row item.
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var game: Games //singular instance of People containing data of character
    @ObservedObject var keyboard = Keyboard()
    @State var tUrl: String = "" //temporary variable to hold user-entered URL
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        ScrollView(.vertical){ //To enable scrolling on portrait and landscape orientation
            VStack() {
                
                //Image display and edit field
                TextField("Enter url to load picture", text: $tUrl, onEditingChanged: {
                    _ in try? self.viewContext.save()
                }, onCommit: {
                    self.game.url = self.tUrl
                })//binding placeholder text to retain changes through navigation
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.gray)
                imgDownload(game.url ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 350, alignment: .center)
                    .multilineTextAlignment(.center)
                
                //Name of the Game
                TextField("Game's name", text: $game.boundName, onEditingChanged: {
                    _ in try? self.viewContext.save()
                })
                    .font(Font.system(.largeTitle).bold())
                    .multilineTextAlignment(.center)
                
                //Field 1 type and info
                HStack { //contains fixed field nation and referenced field native home of character
                    TextField("Field type", text: $game.boundField1, onEditingChanged: {
                        _ in try? self.viewContext.save()
                    })
                        .frame(width: 120)
                    TextField("Field information", text: $game.boundPlayers, onEditingChanged: {
                        _ in try? self.viewContext.save()
                    })//binding placeholder text to retain changes through navigation
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                //Field2 type and info
                HStack { //contains fixed field powers and referenced field powers of character
                    TextField("Field type", text: $game.boundField2, onEditingChanged: {
                        _ in try? self.viewContext.save()
                    })
                        .frame(width: 120)
                    TextField("Field information", text: $game.boundPlayTime, onEditingChanged: {
                        _ in try? self.viewContext.save()
                    })//binding placeholder text to retain changes through navigation
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                //Field3 type and info
                HStack { //contains fixed field voiced by and referenced field name of character's voice actor
                    TextField("Field type", text: $game.boundField3, onEditingChanged: {
                        _ in try? self.viewContext.save()
                    })
                        .frame(width: 120)
                    TextField("Field information", text: $game.boundPublished, onEditingChanged: {
                        _ in try? self.viewContext.save()
                    })//binding placeholder text to retain changes through navigation
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                
                //Field4 type and info
                HStack { //contains fixed field voiced by and referenced field name of character's voice actor
                    TextField("Field type", text: $game.boundField4, onEditingChanged: {
                        _ in try? self.viewContext.save()
                    })
                        .frame(width: 120)
                    TextField("Field information", text: $game.boundSkills, onEditingChanged: {
                        _ in try? self.viewContext.save()
                    })//binding placeholder text to retain changes through navigation
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                //Navigation link to location that this game is available at
                NavigationLink(destination: LocationView(location: game.availabilityLocation ?? Location(context: viewContext))) {
                    Text("Where can I play this game?")
                }
                
                Spacer(minLength: 25)
                
                //Notes field
                VStack {
                Text("Notes:\t\t")
                    .font(.body)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                TextField("Insert text here", text: $game.boundNotes, onEditingChanged: {
                    _ in try? self.viewContext.save()
                }) .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            } .frame(width: UIScreen.main.bounds.width-50, alignment: .center )
        } .offset(x: 0, y: CGFloat(-keyboard.h))
    }
}
