import Foundation
import CoreData

class MealViewModel: ObservableObject {
    @Published var mealOptions: [MealOption] = []

    init() {
        loadOptions()
    }

    func loadOptions() {
        let fetchRequest: NSFetchRequest<MealOptionEntity> = MealOptionEntity.fetchRequest()
        do {
            let mealEntities = try CoreDataStack.shared.context.fetch(fetchRequest)
            mealOptions = mealEntities.map { MealOption(name: $0.name ?? "", isFavorite: $0.isFavorite) }
        } catch {
            print("Failed to fetch meal options: \(error)")
        }
    }

    func addMealOption(name: String) {
        let newMeal = MealOptionEntity(context: CoreDataStack.shared.context)
        newMeal.name = name
        newMeal.isFavorite = false
        saveContext()
        loadOptions()
    }

    private func saveContext() {
        CoreDataStack.shared.saveContext()
    }
}
