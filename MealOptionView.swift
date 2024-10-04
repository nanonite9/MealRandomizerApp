//
//  MealOptionView.swift
//  MealRandomizerApp
//
//  Created by Ayana N on 2024-09-23.
//  Copyright © 2024 Ayana N. All rights reserved.
//

import SwiftUI

struct MealOptionView: View {
    @EnvironmentObject var mealViewModel: MealViewModel
    @State private var newMealName = ""
    @State private var newMealCategory = ""

    var body: some View {
        VStack {
            TextField("Enter Meal Option", text: $newMealName)
            // adding and displaying meal options
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Meal Option") {
                mealViewModel.addMealOption(name: newMealName)
                newMealName = ""
            }
        }
        .padding()
    }
}

// This view handles adding and displaying meal options.

/*
    private func addMealOption() {
        
    }

    private func deleteMealOptions(at offsets: IndexSet) {
        
    }
} // different way
*/ 