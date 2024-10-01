import CoreData
import Foundation

class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MealOptionModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

/*
func addMealOption(name: String, category: String, isFavorite: Bool) {
    let context = persistentContainer.viewContext // Your Core Data stack setup
    let newMealOption = MealOptionEntity(context: context)
    newMealOption.name = name
    newMealOption.category = category
    newMealOption.isFavorite = isFavorite
    
    do {
        try context.save() // Save the new meal option to Core Data
        print("Meal option saved: \(newMealOption.name ?? "")")
    } catch {
        print("Failed to save meal option: \(error)")
    }
}
*/