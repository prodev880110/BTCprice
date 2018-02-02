//
//  TickerApiServiceTest.swift
//  BitPriceTests
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest
@testable import BitPrice

class TickerApiServiceTest: ApiServiceTest {
    
    private let service = TickerApiService()
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
    }
    
    // MARK: - Test
    
    func testGetTickerApiService() {
        service.get(success: { (data) in
            self.success()
        }) { (error) in
            self.failure(error: error)
        }

        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }
    
}
