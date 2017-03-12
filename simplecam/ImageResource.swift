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
    
    
    
    func insert(image: UIImage) {
        let imgObj = NSEntityDescription.insertNewObject(forEntityName: "Image", into: persistentContainer.viewContext) as! Image
        
        imgObj.imageData = UIImageJPEGRepresentation(image, 100) as NSData?
        saveContext()
    }
    
    
    
    
    func getImages() -> [Image] {
        
        var images = [Image]()
        
        let request: NSFetchRequest<Image> = Image.fetchRequest()
        
        do {
            images = try persistentContainer.viewContext.fetch(request)
        }catch {
            print(error.localizedDescription)
        }
        
        return images
    }
}
