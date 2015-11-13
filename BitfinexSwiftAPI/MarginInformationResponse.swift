//
//  MarginInformationResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct MarginInformationResponse: ResponseObjectSerializable {

    public let marginInfos: [MarginInfo]
    
    public init(json: JSON) throws {
        
        guard let arr = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.marginInfos = arr.map { try MarginInfo(json: $0) }
        
    }
}
