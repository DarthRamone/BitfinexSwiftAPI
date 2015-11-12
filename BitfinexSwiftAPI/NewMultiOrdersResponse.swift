//
//  NewMultiOrdersResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON


public struct NewMultiOrdersResponse: ResponseObjectSerializable {
    
    public let status: String
    
    public let orders: [NewOrderResponse]
    
    public init(json: JSON) throws {
        
        guard let dict = json.dictionary else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        guard let status = dict["status"]?.stringValue else {
            throw BitfinexErrors.InvalidRequest(message: "Invalid multi order request")
        }
        
        guard let resArray = dict["order_ids"]?.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        self.status = status
        try self.orders = resArray.map { try NewOrderResponse(json: $0) }
    }
}
