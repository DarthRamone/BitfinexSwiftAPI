//
//  OrderType.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

public enum OrderType: String {
    
    case Limit = "exchange limit"
    
    case Market = "exchange market"
    
    case Stop = "exchange stop"
    
    case TrailingStop = "exchange trailing stop"
    
    case FillOrKill = "exchange fill-or-kill"
}