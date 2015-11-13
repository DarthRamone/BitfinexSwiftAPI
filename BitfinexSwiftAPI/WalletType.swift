//
//  Wallet.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

public enum WalletType: String {
    
    case Trading = "trading"
    
    case Exchange = "exchange"
    
    case Deposit = "deposit"
    
}

extension WalletType {
    
    public init?(string: String) {
        
        switch string.lowercaseString {
        case "trading": self.init(rawValue: "trading")
        case "exchange": self.init(rawValue: "exchange")
        case "deposit": self.init(rawValue: "deposit")
        default: return nil
        }
    }
    
}