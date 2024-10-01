import XCTest

class MealRandomizerUITests: XCTestCase {
    
    func testSpinButton() {
        let app = XCUIApplication()
        app.launch()

        // Ensure spin button exists
        let spinButton = app.buttons["Spin the Wheel"]
        XCTAssertTrue(spinButton.exists, "The spin button should exist.")

        // Tap spin button
        spinButton.tap()

        // Assert meal option is displayed after spinning
        let selectedMealLabel = app.staticTexts["SelectedMealLabel"]
        XCTAssertTrue(selectedMealLabel.exists, "A selected meal should be displayed.")
        
        // Check label has a non-empty value
        XCTAssertFalse(selectedMealLabel.label.isEmpty, "The selected meal label should not be empty.")

        // Checking the "favourite" button visibility
        let favouriteButton = app.buttons["Add to Favourites"]
        XCTAssertTrue(favouriteButton.exists, "The add to favourites button should exist.")
    }
}
