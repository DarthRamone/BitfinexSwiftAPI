//
//  CancellAllOrdersResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct CancellAllOrderResponse: ResponseObjectSerializable {
    
    public let result: String
    
    public init(json: JSON) throws {
        
        guard
            let dict = json.dictionary,
            let result = dict["result"]?.stringValue
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        self.result = result
    }
}
