//
//  OrderType.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

public enum OrderType: String {
    
    case ExchangeLimit = "exchange limit"
    
    case ExchangeMarket = "exchange market"
    
    case ExchangeStop = "exchange stop"
    
    case ExchangeTrailingStop = "exchange trailing stop"
    
    case ExchangeFillOrKill = "exchange fill-or-kill"
    
    
    case Limit = "limit"
    
    case Market = "market"
    
    case Stop = "stop"
    
    case TrailingStop = "trailing stop"
    
    case FillOrKill = "fill-or-kill"

}

extension OrderType {
    
    public init?(string: String) {
        
        switch string.lowercaseString {
        case "exchange limit": self.init(rawValue: "exchange limit")
        case "exchange market": self.init(rawValue: "exchange market")
        case "exchange stop": self.init(rawValue: "exchange stop")
        case "exchange trailing stop": self.init(rawValue: "exchange trailing stop")
        case "exchange fill-or-kill": self.init(rawValue: "exchange fill-or-kill")
            
        case "limit": self.init(rawValue: "limit")
        case "market": self.init(rawValue: "market")
        case "stop": self.init(rawValue: "stop")
        case "trailing stop": self.init(rawValue: "trailing stop")
        case "fill-or-kill": self.init(rawValue: "fill-or-kill")
        default: return nil
        }
    }

    
}