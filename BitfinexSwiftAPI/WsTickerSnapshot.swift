//
//  WsTickerResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 14.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct WsTickerSnapshot {
    
    public let channelId: Int
    
    public let bid: Float
    
    public let bidSize: Float
    
    public let ask: Float
    
    public let askSize: Float
    
    public let dailyChange: Float
    
    public let dailyChangePercent: Float
    
    public let lastPrice: Float
    
    public let volume: Float
    
    public let high: Float
    
    public let low: Float
    
    public init(json: JSON) throws {
        
        guard
            let arr = json.array,
            let channelId = arr[0].int,
            let bid = arr[1].float,
            let bidSize = arr[2].float,
            let ask = arr[3].float,
            let askSize = arr[4].float,
            let dailyChange = arr[5].float,
            let dailyChangePercent = arr[6].float,
            let lastPrice = arr[7].float,
            let volume = arr[8].float,
            let high = arr[9].float,
            let low = arr[10].float
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        self.channelId = channelId
        self.bid = bid
        self.bidSize = bidSize
        self.ask = ask
        self.askSize = askSize
        self.dailyChange = dailyChange
        self.dailyChangePercent = dailyChangePercent
        self.lastPrice = lastPrice
        self.volume = volume
        self.high = high
        self.low = low
    }
    
    
}
