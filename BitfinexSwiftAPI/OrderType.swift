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