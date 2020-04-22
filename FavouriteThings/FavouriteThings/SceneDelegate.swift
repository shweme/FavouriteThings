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
    var game: FaveGames = FaveGames()
    var dataFileName = "FaveThings.txt"

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        do {
          let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
          let documentFolderURL = urls.first!
          let fileURL = documentFolderURL.appendingPathComponent(dataFileName)
          let t = try Data(contentsOf: fileURL)
          let decoder = JSONDecoder()
          game = try decoder.decode(FaveGames.self, from: t)
        } catch {
          print("Got \(error)")
        }
        
//        game.add(Games(url: "https://i.ebayimg.com/images/g/724AAOSwB-1YyeTu/s-l300.jpg", name: "Settlers of Catan", players: "3 - 4", playTime: "90 - 120 minutes", published: "1995", skills: "Strategy, negotiation", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"))
//        game.add(Games(url: "https://contestimg.wish.com/api/webimage/5be12829febb6831319763fb-large.jpg?cache_buster=884fa7d14cdb857bda250f549e82ad24", name: "Unstable Unicorns", players: "2 - 8", playTime: "30 - 45 minutes", published: "2018", skills: "Strategy", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"))
//        game.add(Games(url: "https://cf.geekdo-images.com/imagepage/img/lLzsghVIr1cEC6Dii4_GA0ySWpQ=/fit-in/900x600/filters:no_upscale()/pic5164305.jpg", name: "Secret Hitler", players: "5 - 10", playTime: "30 - 60 minutes", published: "2018", skills: "Deception, strategy", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"))
        
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Get the managed object context from the shared persistent container.
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext

        // Create the SwiftUI view and set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
        
        
        let contentView = ContentView(game: game).environment(\.managedObjectContext, context)

        // Use a UIHostingController as window root view controller.
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
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        
        do {
          let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
          let documentFolderURL = urls.first!
          let fileURL = documentFolderURL.appendingPathComponent(dataFileName)
          let json = JSONEncoder()
          let data = try json.encode(game)
          try data.write(to: fileURL)
        } catch {
          print("Got \(error)")
        }

        
        
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
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}


struct SceneDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
