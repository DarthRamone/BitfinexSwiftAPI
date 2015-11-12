//
//  FundingbookResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//
import SwiftyJSON


public struct FundingbookResponse: ResponseObjectSerializable {
    
    public let bids: [Fundingbook]
    
    public let asks: [Fundingbook]
    
    public init(json: JSON) throws {
        
        guard let resDict = json.dictionary,
            let bidsArray = resDict["bids"]?.array,
            let asksArray = resDict["asks"]?.array
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.bids = bidsArray.map { try Fundingbook(json: $0) }
        try self.asks = asksArray.map { try Fundingbook(json: $0) }
    }
    
}