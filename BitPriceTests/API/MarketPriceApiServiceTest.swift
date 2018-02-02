//
//  MarketPriceApiServiceTest.swift
//  BitPriceTests
//
//  Created by Bruno Tortato Furtado on 25/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest
@testable import BitPrice

class MarketPriceApiServiceTest: ApiServiceTest {
    
    private let service = MarketPriceApiService()
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
    }
    
    // MARK: - Test
    
    func testGetWeekMarkePriceApiService() {
        get(reference: .week)
    }
    
    func testGetMonthMarkePriceApiService() {
        get(reference: .month)
    }
    
    func testGetYearMarkePriceApiService() {
        get(reference: .year)
    }
    
    func testGetAllMarkePriceApiService() {
        get(reference: .all)
    }
    
    // MARK: - Private
    
    private func get(reference: ReferenceType) {
        service.get(reference: reference, success: { (url, data) in
            do {
                _ = try JSONDecoder().decode(MarketPrice.self, from: data)
                self.success()
            } catch let error {
                self.failure(error: error)
            }
        }) { error in
            self.failure(error: error)
        }

        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }
    
}
