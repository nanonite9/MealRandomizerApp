import XCTest
@testable import MealRandomizerApp

class MealRandomizerAppTests: XCTestCase {
    var mealViewModel: MealViewModel!

    override func setUp() {
        super.setUp()
        mealViewModel = MealViewModel()
        mealViewModel.loadOptions()
    }

    func testMealOptionsAreLoaded() {
        XCTAssertFalse(mealViewModel.mealOptions.isEmpty, "Meal options should be loaded")
    }

    func testRandomSelection() {
        let selectedMeal = mealViewModel.mealOptions.randomElement()
        XCTAssertNotNil(selectedMeal, "A meal should be selected")
    }
}
