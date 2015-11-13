//
//  ActiveCreditsResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct ActiveCretitsResponse: ResponseObjectSerializable {
    
    public let offers: [MarginOffer]
    
    public init(json: JSON) throws {
        
        guard let arr = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.offers = arr.map { try MarginOffer(json: $0) }
    }
    
}
