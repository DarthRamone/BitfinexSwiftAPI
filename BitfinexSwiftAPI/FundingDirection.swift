//
//  FundingDirection.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

public enum FundingDirection: String {
    
    case Lend = "lend"
    
    case Loan = "loan"
}

extension FundingDirection {
    
    public init?(string: String) {
        
        switch string.lowercaseString {
        case "lend": self.init(rawValue: "lend")
        case "loan": self.init(rawValue: "loan")
        default: return nil
        }
    }
}