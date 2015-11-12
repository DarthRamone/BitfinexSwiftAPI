//
//  MarginOffer.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct MarginOffer: ResponseObjectSerializable {
    
    public let id: Int
    
    public let currency: Currency
    
    public let rate: Float
    
    public let period: Int
    
    public let direction: FundingDirection
    
    public let timestamp: NSDate
    
    public let isLive: Bool
    
    public let isCancelled: Bool
    
    public let originalAmount: Float
    
    public let remainingAmount: Float
    
    public let executedAmount: Float
    
    public let offerId: Int
    
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let id = dict["id"]?.intValue,
            let currStr = dict["currency"]?.stringValue,
            let rate = dict["rate"]?.floatValue,
            let period = dict["period"]?.intValue,
            let dirStr = dict["direction"]?.stringValue,
            let timestamp = dict["timestamp"]?.doubleValue,
            let isLive = dict["is_live"]?.boolValue,
            let isCancelled = dict["is_cancelled"]?.boolValue,
            let originalAmount = dict["original_amount"]?.floatValue,
            let remainingAmount = dict["remaining_amount"]?.floatValue,
            let executedAmount = dict["executed_amount"]?.floatValue,
            let offerId = dict["offer_id"]?.intValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let currency = Currency(rawValue: currStr) else {
            throw BitfinexErrors.InvalidCurrency(currency: currStr)
        }
        
        guard let direction = FundingDirection(rawValue: dirStr) else {
            throw BitfinexErrors.InvalidFundingDirection(direction: dirStr)
        }
        
        self.id = id
        self.currency = currency
        self.rate = rate
        self.period = period
        self.direction = direction
        self.timestamp = NSDate(timeIntervalSinceNow: timestamp)
        self.isLive = isLive
        self.isCancelled = isCancelled
        self.originalAmount = originalAmount
        self.remainingAmount = remainingAmount
        self.executedAmount = executedAmount
        self.offerId = offerId
    }
}
