//
//  Fee.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct Fees {
    
    public let pairs: Currency
    
    public let makerFees: Float
    
    public let takerFees: Float
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let pairsStr = dict["pairs"]?.stringValue,
            let makerFees = dict["maker_fees"]?.floatValue,
            let takerFees = dict["taker_fees"]?.floatValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let pairs = Currency(string: pairsStr) else {
            throw BitfinexErrors.InvalidCurrency(currency: pairsStr)
        }
        
        self.pairs = pairs
        self.makerFees = makerFees
        self.takerFees = takerFees
    }
    
}
