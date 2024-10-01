import SwiftUI

@main
struct MealRandomizerApp: App {
    // Create a persistent container to manage Core Data
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            // Set the ContentView as initial view
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext) // Pass the managed object context to the environment
        }
    }
}
