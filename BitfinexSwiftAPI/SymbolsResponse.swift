//
//  SymbolsResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct SymbolsResponse: ResponseObjectSerializable {
    
    public let symbols: [Symbol]
    
    public init?(json: JSON) throws {
        
        guard let array = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.symbols = array.map {
            
            guard let strSym = $0.string else {
                throw JSONErrors.InvalidJSON(json: json)
            }
            
            guard let symbol = Symbol(string: strSym) else {
                throw BitfinexErrors.InvalidSymbol(symbol: strSym)
            }
            
            return symbol
        }
    }
}
