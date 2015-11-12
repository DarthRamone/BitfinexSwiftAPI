//
//  BalanceHistoryResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct BalanceHistoryResponse: ResponseObjectSerializable {
    
    public let balanceLedgers: [BalanceLedger]
    
    public init(json: JSON) throws {
        
        guard let arr = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.balanceLedgers = arr.map { try BalanceLedger(json: $0) }
    }
}
