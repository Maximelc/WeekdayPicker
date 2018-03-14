//
//  DemoTests.swift
//  DemoTests
//
//  Created by Maxime Le Coat on 14/03/2018.
//  Copyright © 2018 Maximelc. All rights reserved.
//

import XCTest
@testable import Demo

@available(iOS 9.0, *)
final class DemoTests: XCTestCase {
    
    // MARK: - Privates
    private let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}

// MARK: - DemoTests
@available(iOS 9.0, *)
extension DemoTests {
    
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
