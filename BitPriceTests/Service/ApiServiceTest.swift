//
//  ApiServiceTest.swift
//  BitPriceTests
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest
@testable import BitPrice

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
    
    func failure(_ failure: ServiceFailureType) {
        if failure == .server {
            XCTFail("server service error")
        } else {
            XCTFail("connection service error")
        }
        expectation?.fulfill()
    }
    
}
