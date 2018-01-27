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
        service.delegate = self
    }
    
    // MARK: - Test
    
    func testGetWeekMarkePriceApiService() {
        get(referenceType: .week)
    }
    
    func testGetMonthMarkePriceApiService() {
        get(referenceType: .month)
    }
    
    func testGetYearMarkePriceApiService() {
        get(referenceType: .year)
    }
    
    func testGetAllMarkePriceApiService() {
        get(referenceType: .all)
    }
    
    // MARK: - Private
    
    private func get(referenceType: ReferenceType) {
        service.get(referenceType: referenceType)
        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }
    
}

extension MarketPriceApiServiceTest: MarketPriceApiServiceDelegate {
    
    func marketPriceApiGetDidComplete(marketPrice: MarketPrice) {
        success()
    }
    
    func marketPriceApiGetDidComplete(error: Error?) {
        failure(error: error)
    }
    
}
