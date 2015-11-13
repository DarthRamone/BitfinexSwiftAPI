//
//  Currency.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

public enum Currency: String {
    
    case BTC = "btc"
    
    case LTC = "ltc"
    
    case DRK = "drk"
    
    case USD = "usd"

}

extension Currency {
    
    public init?(string: String) {
        
        switch string.lowercaseString {
        case "btc": self.init(rawValue: "btc")
        case "ltc": self.init(rawValue: "ltc")
        case "drk": self.init(rawValue: "drk")
        case "usd": self.init(rawValue: "usd")
        default: return nil
        }   
    }
    
}