//
//  LendsResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct LendsResponse: ResponseObjectSerializable {
    
    public let trades: [Lend]
    
    public init(json: JSON) throws {
        
        guard let lendsArray = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.trades = lendsArray.map { try Lend(json: $0) }
    }
    
}
