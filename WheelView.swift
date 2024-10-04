//
//  WheelView.swift
//  MealRandomizerApp
//
//  Created by Ayana N on 2024-09-23.
//  Copyright © 2024 Ayana N. All rights reserved.
//

import SwiftUI

struct WheelView: View {
    @EnvironmentObject var mealViewModel: MealViewModel
    @State private var selectedOption: MealOption?
    @State private var isSpinning = false

    var body: some View {
        VStack {
            Image(resources/wheel.png) 
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(isSpinning ? 360 : 0))
                .animation(isSpinning ? Animation.linear(duration: 2).repeatCount(1, autoreverses: false) : .default, value: isSpinning)
                .overlay(Text(selectedOption?.name ?? "").foregroundColor(.white))

            Button("Spin the Wheel") {
                spinWheel()
            }
            .padding()
        }
        .onAppear {
            mealViewModel.loadOptions() // Load meal options
        }
    }

    private func spinWheel() {
        guard !mealViewModel.mealOptions.isEmpty else { return }
        isSpinning = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            selectedOption = mealViewModel.mealOptions.randomElement()
            isSpinning = false
        }
    }
}

// This view handles the wheel spinning animation.