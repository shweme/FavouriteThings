//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    //var game: FaveGames = FaveGames()
    //var dataFileName = "FaveThings.txt"
    //@FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Games.name, ascending: true)], animation: .default) var fg: FetchedResults<Games>
    //@FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FaveGames.title, ascending: true)], animation: .default) var game: FetchedResults<FaveGames>
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Collecting all resources associated with this scene from last time the scene disconnected.
        //creates a "FaveThings.txt" in the case that there isnt already one.
        
// needs to be deleted
//        do {
//          let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//          let documentFolderURL = urls.first!
//          let fileURL = documentFolderURL.appendingPathComponent(dataFileName)
//          let t = try Data(contentsOf: fileURL)
//          let decoder = JSONDecoder()
//          game = try decoder.decode(FaveGames.self, from: t)
//        } catch {
//          print("Got \(error)")
//        }
        
        // Get the managed object context from the shared persistent container.
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext

//        let game = self.game.first ?? FaveGames(context: context)
//        if game.children.count == 0 {
//            let sh = Games()
//            sh.url = "https://cf.geekdo-images.com/imagepage/img/lLzsghVIr1cEC6Dii4_GA0ySWpQ=/fit-in/900x600/filters:no_upscale()/pic5164305.jpg"
//            sh.name = "Secret Hitler"
//            sh.players = "5 - 10"
//            sh.playTime = "20 - 30 minutes"
//            sh.published = "2013"
//            sh.skills = "Strategy, Deception"
//            sh.notes = "Can play with upto 15 players with homemade extensions."
//            sh.field1 = "Players"
//            sh.field2 = "Play time"
//            sh.field3 = "Published in"
//            sh.field4 = "Skills required"
//
//        }
        
        
        
        
        // Creating the SwiftUI view and setting the context as the value for the managedObjectContext environment keyPath.
        
        let contentView = ContentView().environment(\.managedObjectContext, context)

        // Using a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Releasing all resources associated with this scene that can be re-created the next time the scene connects.

//needs to be deleted
//        do {
//          let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//          let documentFolderURL = urls.first!
//          let fileURL = documentFolderURL.appendingPathComponent(dataFileName)
//          let json = JSONEncoder()
//          let data = try json.encode(game)
//          try data.write(to: fileURL)
//        } catch {
//          print("Got \(error)")
//        }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        delegate.saveContext()
    }


}
