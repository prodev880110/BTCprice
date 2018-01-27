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
    
    func testInsertAndFetchUrlRequestDbService() {
        let url = "http://www.ab.com"
        service.insert(url: url, responseBody: "{ 1 : 1 }", date: Date())
        XCTAssert(service.fetch(url: url) != nil)
    }
    
    func testDeleteAndFetchUrlRequestDbService() {
        let url = "http://www.fg.com"
        service.insert(url: url, responseBody: "{ 2 : 2 }", date: Date())
        
        if service.fetch(url: url) != nil {
            service.delete(url: url)
            XCTAssert(service.fetch(url: url) == nil)
            return
        }
        
        XCTFail()
    }
    
    func testDeleteAndFetchRequestDbService() {
        service.insert(url: "http://www.hi.com", responseBody: "{ 3 : 3 }", date: Date())
        service.insert(url: "http://www.jk.com", responseBody: "{ 4 : 4 }", date: Date())
        
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
