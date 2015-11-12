//
//  Position.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct ClaimPositionResponse: ResponseObjectSerializable {
    
    public let id: Int
    
    public let symbol: Symbol
    
    public let status: String
    
    public let basePrice: Float
    
    public let amount: Float
    
    public let timestamp: NSDate
    
    public let swap: Float
    
    public let profitLoss: Float
    
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let id = dict["id"]?.intValue,
            let symbolStr = dict["symbol"]?.stringValue,
            let status = dict["status"]?.stringValue,
            let base = dict["base"]?.floatValue,
            let amount = dict["amount"]?.floatValue,
            let timestamp = dict["timestamp"]?.doubleValue,
            let swap = dict["swap"]?.floatValue,
            let pl = dict["pl"]?.floatValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let symbol = Symbol(rawValue: symbolStr) else {
            throw BitfinexErrors.InvalidSymbol(symbol: symbolStr)
        }
        
        self.id = id
        self.symbol = symbol
        self.status = status
        self.basePrice = base
        self.amount = amount
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
        self.swap = swap
        self.profitLoss = pl
    }
    
}
