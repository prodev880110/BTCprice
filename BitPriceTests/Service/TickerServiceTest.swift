//
//  TickerServiceTest.swift
//  BitPriceTests
//
//  Created by Bruno Tortato Furtado on 03/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest
@testable import BitPrice

class TickerServiceTest: ApiServiceTest {

    private let service = TickerService()

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        service.delegate = self
    }

    // MARK: - Test

    func testGetTickerService() {
        service.get()
        waitForExpectations(timeout: ApiService.Params.timeout, handler: nil)
    }

}

extension TickerServiceTest: TickerServiceDelegate {

    func tickerGetDidComplete(ticker: Ticker, date: Date, fromCache: Bool) {
        self.success()
    }

    func tickerGetDidComplete(failure: ServiceFailureType) {
        self.failure(failure)
    }

}
