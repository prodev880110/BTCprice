//
//  ApiServiceTest.swift
//  BitPriceTests
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest

class ApiServiceTest: XCTestCase {
    
    var expectation: XCTestExpectation?
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        expectation = self.expectation(description: "delegate")
    }
    
    // MARK: - Public
    
    func success() {
        XCTAssertTrue(true)
        expectation?.fulfill()
    }
    
    func failure(error: Error?) {
        if let error = error {
            XCTFail("service error: \(error.localizedDescription)")
        } else {
            XCTFail("unknown service error")
        }
        expectation?.fulfill()
    }
    
}
