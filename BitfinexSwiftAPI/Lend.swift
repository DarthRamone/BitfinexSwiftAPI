//
//  Lend.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct Lend {
    
    public let rate: Float
    
    public let amountLent: Float
    
    public let amountUsed: Float
    
    public let timestamp: NSDate
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let rate = dict["rate"]?.floatValue,
            let amountLent = dict["amount_lent"]?.floatValue,
            let amountUsed = dict["amount_used"]?.floatValue,
            let timestamp = dict["timestamp"]?.doubleValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        self.rate = rate
        self.amountUsed = amountUsed
        self.amountLent = amountLent
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
    }
    
}

