//
//  MealRandomizerApp.swift
//  MealRandomizerApp
//
//  Created by Ayana N on 2024-09-23.
//  Copyright © 2024 Ayana N. All rights reserved.
//

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

// This is the main entry point of our app. It sets up the Core Data stack and injects it into our main ContentView. 