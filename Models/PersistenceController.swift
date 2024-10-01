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
