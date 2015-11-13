//
//  MarginInfo.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct MarginInfo {
    
    public let marginBalance: Float
    
    public let tradableBalance: Float
    
    public let unrealizedPl: Float
    
    public let unrealizedSwap: Float
    
    public let netValue: Float
    
    public let requiredMargin: Float
    
    public let leverage: Float
    
    public let marginRequirement: Float
    
    public let marginLimits: [MarginLimit]
    
    public let message: String
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let marginBalance = dict["margin_balance"]?.floatValue,
            let tradableBalance = dict["tradable_balance"]?.floatValue,
            let unrealizedPl = dict["unrealized_pl"]?.floatValue,
            let unrealizedSwap = dict["unrealized_swap"]?.floatValue,
            let netValue = dict["net_value"]?.floatValue,
            let requiredMargin = dict["required_margin"]?.floatValue,
            let leverage = dict["leverage"]?.floatValue,
            let marginRequirement = dict["margin_requirement"]?.floatValue,
            let marginLimits = dict["margin_limits"]?.array,
            let message = dict["message"]?.stringValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        self.marginBalance = marginBalance
        self.tradableBalance = tradableBalance
        self.unrealizedPl = unrealizedPl
        self.unrealizedSwap = unrealizedSwap
        self.netValue = netValue
        self.requiredMargin = requiredMargin
        self.leverage = leverage
        self.marginRequirement = marginRequirement
        self.message = message
        
        try self.marginLimits = marginLimits.map { try MarginLimit(json: $0) }
    }
}
