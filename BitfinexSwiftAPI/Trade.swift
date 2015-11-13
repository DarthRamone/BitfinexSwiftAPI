//
//  Trade.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct Trade {
    
    public let id: Int
    
    public let timestamp: NSDate
    
    public let price: Float
    
    public let amount: Float
    
    public let exchange: String
    
    public let type: TradeType
    
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let id = dict["tid"]?.intValue,
            let price = dict["price"]?.floatValue,
            let amount = dict["amount"]?.floatValue,
            let strType = dict["type"]?.stringValue,
            let exchange = dict["exchange"]?.stringValue,
            let timestamp = dict["timestamp"]?.doubleValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let type = TradeType(string: strType) else {
            throw BitfinexErrors.InvalidTradeType(tradeType: strType)
        }
        
        self.id = id
        self.price = price
        self.amount = amount
        self.exchange = exchange
        self.type = type
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
        
    }
}