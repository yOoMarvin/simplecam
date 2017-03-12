//
//  ImageResource.swift
//  simplecam
//
//  Created by Marvin Messenzehl on 12.03.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ImageResource {
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "simplecam")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error {
                fatalError(error.localizedDescription)
            }
        })
        
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
               try context.save()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }
}
