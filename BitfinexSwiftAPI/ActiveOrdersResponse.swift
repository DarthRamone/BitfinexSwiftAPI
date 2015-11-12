//
//  ActiveOrdersResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct ActiveOrdersResponse: ResponseObjectSerializable {
    
    public let orders: [ActiveOrderResponse]
    
    public init(json: JSON) throws {
        
        guard let resArray = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.orders = resArray.map { try ActiveOrderResponse(json: $0) }
    }
}
