import Foundation
import CoreData

extension MealOptionEntity {
    
    // Fetch request for the MealOptionEntity
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MealOptionEntity> {
        return NSFetchRequest<MealOptionEntity>(entityName: "MealOptionEntity")
    }

    // Name of the meal option 
    @NSManaged public var name: String?
    
    // Category of the meal option 
    @NSManaged public var category: String?
    
    // Indicates if the meal option is marked as a favourite by the user
    @NSManaged public var isFavorite: Bool
    
    // Add a computed property for better usability
    var isFavouriteText: String {
        return isFavourite ? "⭐️ Favourite" : "Not Favourite"
    }
}
