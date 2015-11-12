//
//  SymbolsDetailsResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct SymbolsDetailsResponse: ResponseObjectSerializable {
    
    public let symbols: [SymbolDetails]
    
    
    public init(json: JSON) throws {
        
        guard let symArray = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.symbols = symArray.map { try SymbolDetails(json: $0) }
    }
}
