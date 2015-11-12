//
//  Stats.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 05.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct Stat {
    
    public let period: Int
    
    public var volume: Float
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let period = dict["period"]?.intValue,
            let volume = dict["volume"]?.floatValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        self.period = period
        self.volume = volume
    }
    
}