//
//  Event.swift
//  sample
//
//  Created by Shweta Mehta on 21/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

//
//extension Event {
//    static func create(in managedObjectContext: NSManagedObjectContext){
//        _ = self.init(context: managedObjectContext)
//        
//        do {
//            try  managedObjectContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nserror = error as NSError
//            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//        }
//    }
//}
//
//extension Collection where Element == Event, Index == Int {
//    func delete(at indices: IndexSet, from managedObjectContext: NSManagedObjectContext) {
//        indices.forEach { managedObjectContext.delete(self[$0]) }
// 
//        do {
//            try managedObjectContext.save()
//        } catch {
//            // Replace this implementation with code to handle the error appropriately.
//            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            let nserror = error as NSError
//            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//        }
//    }
//}
