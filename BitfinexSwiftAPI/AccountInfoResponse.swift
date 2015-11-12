//
//  AccountInfoResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct AccountInfoResponse: ResponseObjectSerializable {
    
    let makerFees: Float
    
    let takerFees: Float
    
    let fees: [Fees]
    
    public init?(json: JSON) throws {
        
        guard
            let dict = json.array?[0].dictionary,
            let makerFees = dict["maker_fees"]?.floatValue,
            let takerFees = dict["taker_fees"]?.floatValue,
            let fees      = dict["fees"]?.feesArray
        else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        self.makerFees = makerFees
        self.takerFees = takerFees
        self.fees = fees
    }
}