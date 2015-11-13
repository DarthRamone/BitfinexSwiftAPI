//
//  MarginLimit.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct MarginLimit {
    
    public let onPair: Symbol
    
    public let initialMargin: Float
    
    public let marginRequirement: Float
    
    public let tradableBalance: Float
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let pairStr = dict["on_pair"]?.stringValue,
            let initialMargin = dict["initial_margin"]?.floatValue,
            let marginRequirement = dict["margin_requirement"]?.floatValue,
            let tradableBalance = dict["tradable_balance"]?.floatValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let onPair = Symbol(rawValue: pairStr) else {
            throw BitfinexErrors.InvalidSymbol(symbol: pairStr)
        }
        
        self.onPair = onPair
        self.initialMargin = initialMargin
        self.marginRequirement = marginRequirement
        self.tradableBalance = tradableBalance
    }
}
