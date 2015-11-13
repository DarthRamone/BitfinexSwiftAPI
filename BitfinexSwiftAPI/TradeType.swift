//
//  TradeType.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

public enum TradeType: String {
    
    case Sell = "sell"
    
    case Buy = "buy"
    
    case Undefined = ""

}

extension TradeType {
    
    public init?(string: String) {
        
        switch string.lowercaseString {
        case "sell": self.init(rawValue: "sell")
        case "buy": self.init(rawValue: "buy")
        case "": self.init(rawValue: "")
        default: return nil
        }
    }
    
}