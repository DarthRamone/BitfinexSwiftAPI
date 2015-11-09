//
//  DepositNewResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 09.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct DepositNewResponse: ResponseObjectSerializable {
    
    let method: DepositMethod

    let currency: Currency
    
    let address: String
    
    public init?(json: JSON) throws {
        
        guard
            let result = json.dictionary?["result"]?.string,
            let method = json.dictionaryValue["method"]?.string,
            let currency = json.dictionaryValue["currency"]?.string,
            let address = json.dictionaryValue["address"]?.string
        else {
                throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard result == "success" else {
            throw BitfinexErrors.InvalidRequest(message: address)
        }
        
        guard let castedMethod = DepositMethod(rawValue: method) else {
            throw BitfinexErrors.InvalidDeliveryMethod(method: method)
        }
        
        guard let castedCurrency = Currency(rawValue: currency) else {
            throw BitfinexErrors.InvalidCurrency(currency: currency)
        }
        
        self.address = address
        self.currency = castedCurrency
        self.method = castedMethod
    }
}