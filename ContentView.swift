//
//  ContentView.swift
//  MealRandomizerApp
//
//  Created by Ayana N on 2024-09-23.
//  Copyright © 2024 Ayana N. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mealViewModel = MealViewModel()

    var body: some View {
        TabView {
            WheelView()
                .tabItem {
                    Label("Wheel", systemImage: "circle.fill")
                }
            MealOptionView()
                .tabItem {
                    Label("Meals", systemImage: "list.bullet")
                }
        }
        .environmentObject(mealViewModel)
    }
}

// This view sets up our tab-based navigation. systemImage to get built-in icons.