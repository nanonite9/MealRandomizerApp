import SwiftUI

struct MealOptionView: View {
    @EnvironmentObject var mealViewModel: MealViewModel
    @State private var newMealName = ""

    var body: some View {
        VStack {
            TextField("Enter Meal Option", text: $newMealName)
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
