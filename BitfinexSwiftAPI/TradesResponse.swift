//
//  TradesResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct TradesResponse: ResponseObjectSerializable {
    
    public let trades: [Trade]
    
    public init(json: JSON) throws {
    
        guard let tradesArray = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.trades = tradesArray.map { try Trade(json: $0) }
    }
    
}
