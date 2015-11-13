//
//  Symbol.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

public enum Symbol: String {
    
    case BTCUSD = "btcusd"
    
    case LTCUSD = "ltcusd"
    
    case LTCBTC = "ltcbtc"
    
}

extension Symbol {
    
    public init?(string: String) {
        
        switch string.lowercaseString {
        case "btcusd": self.init(rawValue: "btcusd")
        case "ltcusd": self.init(rawValue: "ltcusd")
        case "ltcbtc": self.init(rawValue: "ltcbtc")
        default: return nil
        }
        
    }
    
}