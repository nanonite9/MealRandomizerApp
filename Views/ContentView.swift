import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WheelView()
                .navigationTitle("Meal Randomizer")
        }
    }
}

Text(selectedMeal)
    .accessibilityIdentifier("SelectedMealLabel") // Set accessibility identifier

Button(action: spin) {
    Text("Spin the Wheel")
}
.accessibilityIdentifier("Spin the Wheel") // Set accessibility identifier