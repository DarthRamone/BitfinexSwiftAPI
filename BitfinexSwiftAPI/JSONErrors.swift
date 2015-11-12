//
//  JSONErrors.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation
import SwiftyJSON

public enum JSONErrors: ErrorType {
    
    case InvalidJSON(json: JSON)
    
}

public enum BitfinexErrors: ErrorType {
    
    case InvalidRequest(message: String)
    
    case InvalidDeliveryMethod(method: String)
    
    case InvalidCurrency(currency: String)
    
    case InvalidSymbol(symbol: String)
}