//
//  MealViewModel.swift
//  MealRandomizerApp
//
//  Created by Ayana N on 2024-09-23.
//  Copyright © 2024 Ayana N. All rights reserved.
//

import Foundation
import CoreData

class MealViewModel: ObservableObject {
    @Published var mealOptions: [MealOptionEntity] = []

    init() {
        loadOptions()
    }

    func loadOptions() {
        let fetchRequest: NSFetchRequest<MealOptionEntity> = MealOptionEntity.fetchRequest()
        do {
            // let mealEntities = try CoreDataStack.shared.context.fetch(fetchRequest)
            // mealOptions = mealEntities.map { MealOption(name: $0.name ?? "", isFavourite: $0.isFavourite) }
            mealOptions = try CoreDataStack.shared.context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch meal options: \(error)")
        }
    }

    func addMealOption(name: String, category: String, isFavourite: Bool = false) {
        CoreDataStack.shared.addMealOption(name: name, category: category, isFavourite: isFavourite)
        //let newMeal = MealOptionEntity(context: CoreDataStack.shared.context)
        //newMeal.name = name
        //newMeal.isFavourite = false
        //saveContext()
        loadOptions()
    }

    //private func saveContext() {
    //    CoreDataStack.shared.saveContext()
    //}
    func toggleFavourite(mealOption: MealOptionEntity) {
        mealOption.isFavourite.toggle()
        CoreDataStack.shared.saveContext()
        loadOptions()
    }
}

// This ViewModel handles the business logic for our meal options.
// The @Published property wrapper automatically notifies observers when the value changes.