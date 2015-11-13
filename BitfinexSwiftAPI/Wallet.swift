//
//  Wallet.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct Wallet {
    
    public let type: WalletType
    
    public let currency: Currency
    
    public let amount: Float
    
    public let available: Float
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let typeStr = dict["type"]?.stringValue,
            let currStr = dict["currency"]?.stringValue,
            let amount = dict["amount"]?.floatValue,
            let available = dict["available"]?.floatValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let type = WalletType(rawValue: typeStr) else {
            throw BitfinexErrors.InvalidWalletType(type: typeStr)
        }
        
        guard let currency = Currency(rawValue: currStr) else {
            throw BitfinexErrors.InvalidCurrency(currency: currStr)
        }
        
        self.type = type
        self.currency = currency
        self.amount = amount
        self.available = available
    }
    
}
