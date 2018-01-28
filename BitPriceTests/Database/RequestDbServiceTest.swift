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
        let ref = ReferenceType.week.rawValue
        service.insert(reference: ref, responseBody: "{ 1 : 1 }", date: Date())
        XCTAssert(service.fetch(reference: ref) != nil)
    }
    
    func testDeleteAndFetchReferenceRequestDbService() {
        let ref = ReferenceType.month.rawValue
        service.insert(reference: ref, responseBody: "{ 2 : 2 }", date: Date())
        
        if service.fetch(reference: ref) != nil {
            service.delete(reference: ref)
            XCTAssert(service.fetch(reference: ref) == nil)
            return
        }
        
        XCTFail()
    }
    
    func testDeleteAndFetchRequestDbService() {
        service.insert(reference: ReferenceType.all.rawValue,
                       responseBody: "{ 3 : 3 }",
                       date: Date())
        
        service.insert(reference: ReferenceType.week.rawValue,
                       responseBody: "{ 4 : 4 }",
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

        XCTFail()
    }
    
}
