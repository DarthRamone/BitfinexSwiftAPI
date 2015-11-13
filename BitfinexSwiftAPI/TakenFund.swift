//
//  TakenFund.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct TakenFund {
    
    public let id: Int
    
    public let positionId: Int
    
    public let currency: Currency
    
    public let rate: Float
    
    public let period: Int
    
    public let amount: Float
    
    public let timestamp: NSDate
    
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let id = dict["id"]?.intValue,
            let positionId = dict["position_id"]?.intValue,
            let currStr = dict["currency"]?.stringValue,
            let rate = dict["rate"]?.floatValue,
            let period = dict["period"]?.intValue,
            let amount = dict["amount"]?.floatValue,
            let timestamp = dict["timestamp"]?.doubleValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let currency = Currency(string: currStr) else {
            throw BitfinexErrors.InvalidCurrency(currency: currStr)
        }
        
        self.id = id
        self.positionId = positionId
        self.currency = currency
        self.rate = rate
        self.period = period
        self.amount = amount
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
    }
    
}
