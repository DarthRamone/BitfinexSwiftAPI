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

public class TickerDelegate: WsTickerDelegateProtocol {
    public func messageReceived(msg: WsTickerMessage) {
        
    }
}

class BitfinexSwiftAPITests: XCTestCase {
    
    let client: Client = Client(del: TickerDelegate())

    let timeout: Double = 3000
    
    override func setUp() {
        client.auth("U59Zh82XI3WmHUvPQlpxCjaHm4wvw8VOVwf9pfQ2iuB", apiSecret: "ulIiAavfzRMoS2auTnMV98ZaWBl3NADROKMTGdJ6SdG")
    }
    
    func testTicker() {
        
       let expectation = expectationWithDescription("401")
        
        client.ticker(Symbol.BTCUSD) {
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
    }
    
    func testStats() {
        
        let expectation = expectationWithDescription("401")
        
        client.stats(Symbol.BTCUSD) {
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
    }
    
    func testAccountInfos() {
        
        let expectation = expectationWithDescription("401")
        
        client.accountInfos {
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
        
        XCTAssert(true)
    }
    
    func testDepositNew() {
        
        let expectation = expectationWithDescription("401")
        
        client.depositNew(DepositMethod.Bitcoin, wallet: WalletType.Exchange, renew: false) {
            
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
        
        XCTAssert(true)
    }
    
    
    func testFundingbook() {
        
        let expectation = expectationWithDescription("401")
        
        client.fundingbook(Currency.BTC) {
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
    }
    
    
    func testOrderbook() {
        
        let expectation = expectationWithDescription("401")
        
        client.orderbook {
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
    }

    func testTrades() {
        
        let expectation = expectationWithDescription("401")
        
        client.trades {
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
    }
    
    func testLends() {
        
        let expectation = expectationWithDescription("401")
        
        client.lends {
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
    }
    
    func testSYmbolDetails() {
        
        let expectation = expectationWithDescription("401")
        
        client.symbolsDetails {
            print($0)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(timeout, handler: nil)
    }
}
