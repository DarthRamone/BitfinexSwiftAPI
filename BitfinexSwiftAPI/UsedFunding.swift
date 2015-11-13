//
//  UsedFunding.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct UsedFunding {
    
    public let positionPair: Symbol
    
    public let totalSwaps: Float
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let positionPair = dict["position_pair"]?.stringValue,
            let totalSwaps = dict["total_swaps"]?.floatValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let symbol = Symbol(rawValue: positionPair) else {
            throw BitfinexErrors.InvalidSymbol(symbol: positionPair)
        }
        
        self.positionPair = symbol
        self.totalSwaps = totalSwaps
    }
    
}