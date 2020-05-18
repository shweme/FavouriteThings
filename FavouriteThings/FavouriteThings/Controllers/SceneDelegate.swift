//
//  SceneDelegate.swift
//  FavouriteThings
//
//  The code in this section allows the app to
//      Provide saving capabilities when changes are made;
//      Passes above capabilities to the main view: Content View; and
//      Provide default data to be loaded when there's no previous data.
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
            if fg.count == 0 {
                //if there is no content, creating and loading default data
                NSEntityDescription.insertNewObject(forEntityName: "FaveGames", into: context)
                fg = try context.fetch(req)
                
                //Secret Hitler
                let sh = Games(context: context)
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
                //providing information for location associated to Secret Hitler
//                sh.locationName = "186 Brunswick St, Fortitude Valley QLD 4006"
//                sh.latitudeString = "-27.4559082"
//                sh.longitudeString = "153.0320233"
                
            
                //Settlers of Catan
                let sc = Games(context: context)
                sc.games = fg.first
                sc.url = "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrN8urwpwCWMwTmeU9xLhMmYVkwXA04GQPZxNLh6DGikLasv_n&usqp=CAU"
                sc.name = "Settlers of Catan"
                sc.players = "2 - 4"
                sc.playTime = "90 - 120 minutes"
                sc.published = "1995"
                sc.skills = "Strategy, Negotiation"
                sc.notes = "Place first two houses and roads around resources with numbers between 5 & 10"
                sc.field1 = "Players"
                sc.field2 = "Play time"
                sc.field3 = "Published in"
                sc.field4 = "Skills required"
                //providing information for location associated to Settler of Catan
//                sh.locationName = "186 Brunswick St, Fortitude Valley QLD 4006"
//                sh.latitudeString = "-27.4559082"
//                sh.longitudeString = "153.0320233"
                
                
                //Unstable Unicorns
                let uu = Games(context: context)
                uu.games = fg.first
                uu.url = "https://contestimg.wish.com/api/webimage/5be12829febb6831319763fb-large.jpg?cache_buster=884fa7d14cdb857bda250f549e82ad24"
                uu.name = "Unstable Unicorns"
                uu.players = "2 - 8"
                uu.playTime = "30 - 45 minutes"
                uu.published = "2018"
                uu.skills = "Strategy"
                uu.notes = "Check out the multitude of extensions it has!"
                uu.field1 = "Players"
                uu.field2 = "Play time"
                uu.field3 = "Published in"
                uu.field4 = "Skills required"
                //providing information for location associated to Unstable Unicorns
//                sh.locationName = "186 Brunswick St, Fortitude Valley QLD 4006"
//                sh.latitudeString = "-27.4559082"
//                sh.longitudeString = "153.0320233"
                
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
