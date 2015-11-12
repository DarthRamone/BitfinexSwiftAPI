//
//  Bids.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct Fundingbook {
    
    public let rate: Float
    
    public let amount: Float
    
    public let period: Int
    
    public let timestamp: NSDate
    
    public let frr: Bool
    
    
    public init(json: JSON) throws {
        
        guard let dict = json.dictionary,
              let rate = dict["rate"]?.floatValue,
              let amount = dict["amount"]?.floatValue,
              let period = dict["period"]?.intValue,
              let timestamp = dict["timestamp"]?.doubleValue,
              let frr = dict["frr"]?.stringValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        self.rate = rate
        self.amount = amount
        self.period = period
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
        
        switch frr.lowercaseString {
            case "yes": self.frr = true
            case "no": self.frr = false
            default: throw JSONErrors.InvalidJSON(json: json)
        }
    }
    
}