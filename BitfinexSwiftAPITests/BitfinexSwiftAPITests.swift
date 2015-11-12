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
    
    let client: Client = Client(apiKey: "U59Zh82XI3WmHUvPQlpxCjaHm4wvw8VOVwf9pfQ2iuB", apiSecret: "ulIiAavfzRMoS2auTnMV98ZaWBl3NADROKMTGdJ6SdG")
    let timeout: Double = 3000
//    
//    func testTicker() {
//        
//       let expectation = expectationWithDescription("401")
//        
//        client.ticker {
//            print($0)
//            expectation.fulfill()
//        }
//        
//        waitForExpectationsWithTimeout(timeout, handler: nil)
//    }
//    
//    func testStats() {
//        
//        let expectation = expectationWithDescription("401")
//        
//        client.stats {
//            print($0)
//            expectation.fulfill()
//        }
//        
//        waitForExpectationsWithTimeout(timeout, handler: nil)
//    }
//    
//    func testAccountInfos() {
//        
//        let expectation = expectationWithDescription("401")
//        
//        client.accountInfos {
//            print($0)
//            expectation.fulfill()
//        }
//        
//        waitForExpectationsWithTimeout(timeout, handler: nil)
//        
//        XCTAssert(true)
//    }
//    
//    func testDepositNew() {
//        
//        let expectation = expectationWithDescription("401")
//        
//        client.depositNew(DepositMethod.Bitcoin, wallet: WalletType.Exchange, renew: false) {
//            
//            print($0)
//            expectation.fulfill()
//        }
//        
//        waitForExpectationsWithTimeout(timeout, handler: nil)
//        
//        XCTAssert(true)
//    }
//    
//    
//    func testFundingbook() {
//        
//        let expectation = expectationWithDescription("401")
//        
//        client.fundingbook {
//            print($0)
//            expectation.fulfill()
//        }
//        
//        waitForExpectationsWithTimeout(timeout, handler: nil)
//    }
    
    
//    func testOrderbook() {
//        
//        let expectation = expectationWithDescription("401")
//        
//        client.orderbook {
//            print($0)
//            expectation.fulfill()
//        }
//        
//        waitForExpectationsWithTimeout(timeout, handler: nil)
//    }

    func testTrades() {
        
        let expectation = expectationWithDescription("401")
        
        client.trades {
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
    }
    
}
