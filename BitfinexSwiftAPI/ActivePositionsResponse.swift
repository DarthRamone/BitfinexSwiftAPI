//
//  ActivePositionsResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct ActivePositionsResponse: ResponseObjectSerializable {
    
    public let positions: [Position]
    
    public init(json: JSON) throws {
        
        guard let array = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.positions = array.map { try Position(json: $0) }
    }
    
}
