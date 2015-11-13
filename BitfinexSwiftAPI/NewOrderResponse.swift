//
//  NewOrderResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct NewOrderResponse: ResponseObjectSerializable {
    
    public let id: Int
    
    public let symbol: Symbol
    
    public let exchange: String
    
    public let price: Float
    
    public let avgExecutionPrice: Float
    
    public let side: OrderSide
    
    public let type: OrderType
    
    public let timestamp: NSDate
    
    public let isLive: Bool
    
    public let isCancelled: Bool
    
    public let isHidden: Bool
    
    public let wasForced: Bool
    
    public let originalAmount: Float
    
    public let remainingAmount: Float
    
    public let executedAmount: Float
    
    public let orderId: Int //Wut?
    
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let id = dict["id"]?.intValue,
            let symbolStr = dict["symbol"]?.stringValue,
            let exchange = dict["exchange"]?.stringValue,
            let price = dict["price"]?.floatValue,
            let avgExecutionPrice = dict["avg_execution_price"]?.floatValue,
            let sideStr = dict["side"]?.stringValue,
            let typeStr = dict["type"]?.stringValue,
            let timestamp = dict["timestamp"]?.doubleValue,
            let isLive = dict["is_live"]?.boolValue,
            let isCancelled = dict["is_cancelled"]?.boolValue,
            let isHidden = dict["is_hidden"]?.boolValue,
            let wasForced = dict["was_forced"]?.boolValue,
            let originalAmount = dict["original_amount"]?.floatValue,
            let remainingAmount = dict["remaining_amount"]?.floatValue,
            let executedAmount = dict["executed_amount"]?.floatValue,
            let orderId = dict["order_id"]?.intValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let symbol = Symbol(string: symbolStr) else {
            throw BitfinexErrors.InvalidSymbol(symbol: symbolStr)
        }
        
        guard let type = OrderType(string: typeStr) else {
            throw BitfinexErrors.InvalidTradeType(tradeType: typeStr)
        }
        
        guard let side = OrderSide(string: sideStr) else {
            throw BitfinexErrors.InvalidOrderSide(side: sideStr)
        }
        
        self.id = id
        self.symbol = symbol
        self.exchange = exchange
        self.price = price
        self.avgExecutionPrice = avgExecutionPrice
        self.side = side
        self.type = type
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
        self.isLive = isLive
        self.isCancelled = isCancelled
        self.isHidden = isHidden
        self.wasForced = wasForced
        self.originalAmount = originalAmount
        self.remainingAmount = remainingAmount
        self.executedAmount = executedAmount
        self.orderId = orderId
    }
}
