//
//  DepositWithdrawalHistoryResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public struct DepositWithdrawalHistoryResponse: ResponseObjectSerializable {
    
    public let movements: [DepositWithdrawal]
    
    public init(json: JSON) throws {
        
        guard let arr = json.array else {
            throw JSONErrors.InvalidJSON(json: json)
        }
        
        try self.movements = arr.map { try DepositWithdrawal(json: $0) }
    }
}
