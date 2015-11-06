//
//  BitfinexRequest.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

public enum BitfinexRequest {
    
    case Ticker(symbol: String)
    
    case Symbols
    
    case Stats(symbol: String)
    
    case AccountInfos
    
    case Fundingbook(limits: Limit?)
    
    case Orderbook(symbol: String, limits: Limit?, group: Bool)
    
    case Trades(symbol: String, timestamp: String?, limitTrades: Int)
    
}