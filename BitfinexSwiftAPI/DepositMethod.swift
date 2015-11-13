//
//  DepositMethod.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

public enum DepositMethod: String {
    
    case Bitcoin = "bitcoin"
    
    case Litecoin = "litecoin"
    
    case Darkcoin = "darkcoin"
    
    case Mastercoin = "mastercoin"
}

extension DepositMethod {
    
    public init?(string: String) {
        
        switch string.lowercaseString {
        case "bitcoin": self.init(rawValue: "bitcoin")
        case "litecoin": self.init(rawValue: "litecoin")
        case "darkcoin": self.init(rawValue: "darkcoin")
        case "mastercoin": self.init(rawValue: "mastercoin")
        default: return nil
        }
    }
}