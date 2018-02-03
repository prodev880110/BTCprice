//
//  ViewControllerUITests.swift
//  BitPriceUITests
//
//  Created by Bruno Tortato Furtado on 25/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest

class ViewControllerUITests: XCTestCase {

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    // MARK: - Test

    func testViewControllerHeaderButton() {
        XCUIApplication().buttons["refreshButton"].tap()
    }

    func testViewControllerFooterButtons() {
        XCUIApplication().buttons["weekButton"].tap()
        XCUIApplication().buttons["monthButton"].tap()
        XCUIApplication().buttons["yearButton"].tap()
        XCUIApplication().buttons["allButton"].tap()
    }

}
