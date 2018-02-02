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
        let url = "http://www.abc.com"
        service.insert(url: url, data: Data(), date: Date())
        XCTAssert(service.fetch(url: url) != nil)
    }
    
    func testDeleteAndFetchReferenceRequestDbService() {
        let url = "http://www.cde.com"
        service.insert(url: url, data: Data(), date: Date())
        
        if service.fetch(url: url) != nil {
            service.delete(url: url)
            XCTAssert(service.fetch(url: url) == nil)
            return
        }
        
        XCTFail()
    }
    
    func testDeleteAndFetchRequestDbService() {
        service.insert(url: "http://www.fgh.com",
                       data: Data(),
                       date: Date())
        
        service.insert(url: "http://www.ijk.com",
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

        XCTFail()
    }
    
}
