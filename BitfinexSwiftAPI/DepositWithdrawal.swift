//
//  DepositWithdrawal.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct DepositWithdrawal {
    
    public let id: Int
    
    public let currency: Currency
    
    public let method: DepositMethod
    
    public let type: String
    
    public let amount: Float
    
    public let description: String
    
    public let status: String
    
    public let timestamp: NSDate
    
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let id = dict["id"]?.intValue,
            let currStr = dict["currency"]?.stringValue,
            let methodStr = dict["method"]?.stringValue,
            let type = dict["type"]?.stringValue,
            let amount = dict["amount"]?.floatValue,
            let description = dict["description"]?.stringValue,
            let status = dict["status"]?.stringValue,
            let timestamp = dict["timestamp"]?.doubleValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }

        guard let currency = Currency(string: currStr) else {
            throw BitfinexErrors.InvalidCurrency(currency: currStr)
        }
        
        guard let method = DepositMethod(string: methodStr) else {
            throw BitfinexErrors.InvalidDeliveryMethod(method: methodStr)
        }
        
        self.id = id
        self.currency = currency
        self.method = method
        self.type = type
        self.amount = amount
        self.description = description
        self.status = status
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
    }
    
}
