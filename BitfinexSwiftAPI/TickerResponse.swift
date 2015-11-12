//
//  Pair.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 04.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON


public struct TickerResponse: ResponseObjectSerializable {
    
    public let mid: Float
    
    public let bid: Float
    
    public let ask: Float
    
    public let lastPrice: Float
    
    public let low: Float
    
    public let high: Float
    
    public let volume: Float
    
    public let timestamp: NSDate
    
    public init?(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let mid = dict["mid"]?.floatValue,
            let bid = dict["bid"]?.floatValue,
            let ask = dict["ask"]?.floatValue,
            let low = dict["low"]?.floatValue,
            let high = dict["high"]?.floatValue,
            let volume = dict["timestamp"]?.floatValue,
            let lastPrice = dict["last_price"]?.floatValue,
            let timestamp = dict["timestamp"]?.doubleValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        self.mid = mid
        self.bid = bid
        self.ask = ask
        self.low = low
        self.high = high
        self.volume = volume
        self.lastPrice = lastPrice
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
    }
}