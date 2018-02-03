//
//  RequestDbServiceTest.swift
//  BitPriceTests
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import XCTest
@testable import BitPrice

class RequestDbServiceTest: XCTestCase {

    private let service = RequestDbService()

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()
        service.delete()
    }

    override func tearDown() {
        super.tearDown()
        service.delete()
    }

    // MARK: - Test

    func testInsertAndFetchReferenceRequestDbService() {
        let reference = ReferenceType.week
        service.insert(reference: reference, data: Data(), date: Date())
        XCTAssert(service.fetch(reference: reference) != nil)
    }

    func testDeleteAndFetchReferenceRequestDbService() {
        let reference = ReferenceType.month
        service.insert(reference: reference, data: Data(), date: Date())

        if service.fetch(reference: reference) != nil {
            service.delete(reference: reference)
            XCTAssert(service.fetch(reference: reference) == nil)
            return
        }

        XCTFail("Fail when try to delete and fetch a request")
    }

    func testDeleteAndFetchRequestDbService() {
        service.insert(reference: ReferenceType.year,
                       data: Data(),
                       date: Date())

        service.insert(reference: ReferenceType.all,
                       data: Data(),
                       date: Date())

        if let requests = service.fetch() {
            if requests.count > 1 {
                service.delete()

                if let newRequests = service.fetch() {
                    XCTAssert(newRequests.count == 0)
                } else {
                    XCTAssert(true)
                }

                return
            }
        }

        XCTFail("Fail when try to delete and fetch many requests")
    }

}
