//
//  StatsResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct StatsResponse: ResponseObjectSerializable {
    
    public let Stats: [Stat]
    
    public init?(json: JSON) throws {
        
        guard let resArray = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try Stats = resArray.map { try Stat(json: $0) }
    }
}