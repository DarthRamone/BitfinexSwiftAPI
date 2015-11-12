//
//  SymbolDetail.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct SymbolDetails {
    
    public let pair: Symbol
    
    public let pricePrecision: Int
    
    public let initialMargin: Float
    
    public let minimumMargin: Float
    
    public let maximumOrderSize: Float
    
    public let minimumOrderSize: Float
    
    public let expiration: String
    
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let pairStr = dict["pair"]?.stringValue,
            let expiration = dict["expiration"]?.stringValue,
            let initialMargin = dict["initial_margin"]?.floatValue,
            let minimumMargin = dict["minimum_margin"]?.floatValue,
            let pricePrecision = dict["price_precision"]?.intValue,
            let maximumOrderSize = dict["maximum_order_size"]?.floatValue,
            let minimumOrderSize = dict["minimum_order_size"]?.floatValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let pair = Symbol(rawValue: pairStr) else {
            throw BitfinexErrors.InvalidSymbol(symbol: pairStr)
        }
        
        self.pair = pair
        self.pricePrecision = pricePrecision
        self.initialMargin = initialMargin
        self.minimumMargin = minimumMargin
        self.maximumOrderSize = maximumOrderSize
        self.minimumOrderSize = minimumOrderSize
        self.expiration = expiration
    }
    
}