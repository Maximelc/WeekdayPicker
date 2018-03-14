import XCTest
@testable import WeekdayPicker

class WeekdayPickerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(WeekdayPicker().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),	
    ]
}

// MARK: - WeekdayPickerTests
@available(iOS 9.0, *)
extension WeekdayPickerTests {
    
    /// Change weekday
    private func changeWeekday() {
        app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "Thu")
        XCTAssert(app.staticTexts["Thu"].exists)
    }
    
    /// Change day
    private func changeDay() {
        app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "13")
        XCTAssert(app.staticTexts["13"].exists)
    }
    
    /// Change month
    private func changeMonth() {
        app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "Mar")
        XCTAssert(app.staticTexts["Mar"].exists)
    }
    
    /// Change year
    private func changeYear() {
        app.pickerWheels.element(boundBy: 3).adjust(toPickerWheelValue: "2019")
        XCTAssert(app.staticTexts["2019"].exists)
    }
}