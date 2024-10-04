//
//  PersistenceController.swift
//  MealRandomizerApp
//
//  Created by Ayana N on 2024-09-23.
//  Copyright © 2024 Ayana N. All rights reserved.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: MealModel.xcdatamodeld)
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                // Handle error
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}
