//
//  CoreDataStack.swift
//  MealRandomizerApp
//
//  Created by Ayana N on 2024-09-23.
//  Copyright © 2024 Ayana N. All rights reserved.
//

import CoreData
import Foundation

class CoreDataStack {
    // "Singleton" instance
    static let shared = CoreDataStack()
    
    private init() {} // Ensures singleton usage

    // The persistent container for the application
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MealOptionModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    // The main context for the application
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // Saves changes in the Core Data context
    func saveContext() {
        //let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // Adds a new meal option to the Core Data store
    func addMealOption(name: String, category: String, isFavourite: Bool) {
        let newMealOption = MealOptionEntity(context: context)
        newMealOption.name = name
        newMealOption.category = category
        newMealOption.isFavourite = isFavourite
        
        saveContext()
    }
}



/*
func addMealOption(name: String, category: String, isFavourite: Bool) {
    let context = persistentContainer.viewContext // Your Core Data stack setup
    let newMealOption = MealOptionEntity(context: context)
    newMealOption.name = name
    newMealOption.category = category
    newMealOption.isFavourite = isFavourite
    
    do {
        try context.save() // Save the new meal option to Core Data
        print("Meal option saved: \(newMealOption.name ?? "")")
    } catch {
        print("Failed to save meal option: \(error)")
    }
}
*/

// This class handles all the Core Data stuff. 
// Setting up the database and providing methods to interact with it.