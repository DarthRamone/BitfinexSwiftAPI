//
//  TotalTakenFundsResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct TotalTakenFundsResponse: ResponseObjectSerializable {
    
    public let usedFundings: [UsedFunding]
    
    public init(json: JSON) throws {
        
        guard let arr = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.usedFundings = arr.map { try UsedFunding(json: $0) }
        
    }
    
}
