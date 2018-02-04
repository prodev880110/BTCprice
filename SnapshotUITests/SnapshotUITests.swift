//
//  SnapshotUITests.swift
//  BitPriceUITests
//
//  Created by Bruno Tortato Furtado on 04/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest

class SnapshotUITests: XCTestCase {

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()

        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    // MARK: - Test

    func testSnapshot0() {
        XCUIApplication().buttons["monthButton"].tap()
        snapshot("0Launch")
    }

    func testSnapshot1() {
        XCUIApplication().buttons["allButton"].tap()
        snapshot("1Launch")
    }

}
