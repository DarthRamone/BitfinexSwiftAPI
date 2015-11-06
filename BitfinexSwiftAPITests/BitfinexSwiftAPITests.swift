//
//  BitfinexSwiftAPITests.swift
//  BitfinexSwiftAPITests
//
//  Created by Alexander Moshkin on 04.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import BitfinexSwiftAPI

class BitfinexSwiftAPITests: XCTestCase {
    
    
    
    override func setUp() {
        super.setUp()
        
                // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let x = Client(apiKey: "U59Zh82XI3WmHUvPQlpxCjaHm4wvw8VOVwf9pfQ2iuB", apiSecret: "ulIiAavfzRMoS2auTnMV98ZaWBl3NADROKMTGdJ6SdG")
        
        x.accountInfos()
        
        var stats: [Stats]? = nil
        
        let expectation = expectationWithDescription("401")
        
        x.stats("btcusd") {_stats in
            stats = _stats
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(3000, handler: nil)
        
        XCTAssert(true)

        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
