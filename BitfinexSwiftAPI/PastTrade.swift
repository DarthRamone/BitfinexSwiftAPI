//
//  PastTrade.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct PastTrade {
    
    public let price: Float
    
    public let amount: Float
    
    public let timestamp: NSDate
    
    public let exchange: String
    
    public let type: TradeType
    
    public let feeCurrency: Currency
    
    public let feeAmount: Float
    
    public let tradeId: Int
    
    public let orderId: Int
    
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let price = dict["price"]?.floatValue,
            let amount = dict["amount"]?.floatValue,
            let timestamp = dict["timestamp"]?.doubleValue,
            let exchange = dict["exchange"]?.stringValue,
            let typeStr = dict["type"]?.stringValue,
            let feeCurrencyStr = dict["fee_currency"]?.stringValue,
            let feeAmount = dict["fee_amount"]?.floatValue,
            let tradeId = dict["tid"]?.intValue,
            let orderId = dict["order_id"]?.intValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let type = TradeType(string: typeStr) else {
            throw BitfinexErrors.InvalidTradeType(tradeType: typeStr)
        }
        
        guard let feeCurrency = Currency(string: feeCurrencyStr) else {
            throw BitfinexErrors.InvalidCurrency(currency: feeCurrencyStr)
        }
        
        self.price = price
        self.amount = amount
        self.timestamp = NSDate(timeIntervalSince1970: timestamp)
        self.exchange = exchange
        self.type = type
        self.feeCurrency = feeCurrency
        self.feeAmount = feeAmount
        self.tradeId = tradeId
        self.orderId = orderId
    }
}
