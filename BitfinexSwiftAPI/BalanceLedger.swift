//
//  BalanceLedger.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct BalanceLedger {
    
    public let currency: Currency
    
    public let amount: Float
    
    public let balance: Float
    
    public let description: String
    
    public let timestamp: NSDate
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let currencyStr = dict["currency"]?.stringValue,
            let amount = dict["amount"]?.floatValue,
            let balance = dict["balance"]?.floatValue,
            let description = dict["description"]?.stringValue,
            let timestamp = dict["timestamp"]?.doubleValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let currency = Currency(rawValue: currencyStr) else {
            throw BitfinexErrors.InvalidCurrency(currency: currencyStr)
        }
        
        self.amount = amount
        self.currency = currency
        self.balance = balance
        self.description = description
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
        
    }
    
}
