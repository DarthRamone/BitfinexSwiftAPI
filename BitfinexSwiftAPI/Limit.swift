//
//  Limits.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation

//public class Limits {
//    
//    public var asks: Int?
//    
//    public var bids: Int?
//    
//}

public enum Limit {
    
    case Asks(Int?)
    
    case Bids(Int?)
    
    case Trades(Int?)
    
    case Lends(Int?)
    
}