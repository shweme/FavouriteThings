//
//  SceneDelegate.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Get the managed object context from the shared persistent container.
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext

        //Creating link to FaveGames
        var fg = [FaveGames]()
        let req = NSFetchRequest<FaveGames>(entityName: "FaveGames")

        do {
            fg = try context.fetch(req)
            if fg.count == 0 { //if there is no content, creating and loading default data
                NSEntityDescription.insertNewObject(forEntityName: "FaveGames", into: context)
                fg = try context.fetch(req)
                
                //Secret Hitler
                var sh = Games(context: context)
                sh.games = fg.first
                sh.url = "https://cf.geekdo-images.com/imagepage/img/lLzsghVIr1cEC6Dii4_GA0ySWpQ=/fit-in/900x600/filters:no_upscale()/pic5164305.jpg"
                sh.name = "Secret Hitler"
                sh.players = "5 - 10"
                sh.playTime = "20 - 30 minutes"
                sh.published = "2013"
                sh.skills = "Strategy, Deception"
                sh.notes = "Can play with upto 15 players with homemade extensions."
                sh.field1 = "Players"
                sh.field2 = "Play time"
                sh.field3 = "Published in"
                sh.field4 = "Skills required"
                
                //Settlers of Catan
                sh = Games(context: context)
                sh.games = fg.first
                sh.url = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrN8urwpwCWMwTmeU9xLhMmYVkwXA04GQPZxNLh6DGikLasv_n&usqp=CAU"
                sh.name = "Settlers of Catan"
                sh.players = "2 - 4"
                sh.playTime = "90 - 120 minutes"
                sh.published = "1995"
                sh.skills = "Strategy, Negotiation"
                sh.notes = "Place first two houses and roads around resources with numbers between 5 & 10"
                sh.field1 = "Players"
                sh.field2 = "Play time"
                sh.field3 = "Published in"
                sh.field4 = "Skills required"
                
                //Unstable Unicorns
                sh = Games(context: context)
                sh.games = fg.first
                sh.url = "https://contestimg.wish.com/api/webimage/5be12829febb6831319763fb-large.jpg?cache_buster=884fa7d14cdb857bda250f549e82ad24"
                sh.name = "Unstable Unicorns"
                sh.players = "2 - 8"
                sh.playTime = "30 - 45 minutes"
                sh.published = "2018"
                sh.skills = "Strategy"
                sh.notes = "Check out the multitude of extensions it has!"
                sh.field1 = "Players"
                sh.field2 = "Play time"
                sh.field3 = "Published in"
                sh.field4 = "Skills required"
                try? context.save()
            }
        } catch {
            print("Got \(error)")
        }
        
        
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
