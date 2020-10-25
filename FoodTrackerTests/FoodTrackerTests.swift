//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Shakeel Mohamed on 10/18/20.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {

    func testMealInitializationSucceeds() {
        let notEmptyStringMeal = Meal.init(name: "Fried Rice", photo: nil)
        XCTAssertNotNil(notEmptyStringMeal)
    }
    
    func testMealInitializationFails() {
        let emptyStringMeal = Meal.init(name: "", photo: nil)
        XCTAssertNil(emptyStringMeal)
    }
    
    func testLargeMealName() {
        let largeNameMeal = Meal.init(name: "Pan Pisaa etudiano tmoachri sirichacha", photo: nil)
        XCTAssertNil(largeNameMeal)
    }

}
