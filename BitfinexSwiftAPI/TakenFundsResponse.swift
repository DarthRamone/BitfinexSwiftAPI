//
//  TakenFundsResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct TakenFundsResponse: ResponseObjectSerializable {
    
    public let funds: [TakenFund]
    
    public init(json: JSON) throws {
        
        guard let arr = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.funds = arr.map { try TakenFund(json: $0) }
    }
}