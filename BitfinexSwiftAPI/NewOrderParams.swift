//
//  NewOrderParams.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

public struct NewOrderParams {
    
    public let symbol: Symbol
    
    public let amount: Float
    
    public let price: Float
    
    public let exchange = "bitfinex"
    
    public let side: OrderSide
    
    public let type: OrderType
    
    public let isHidden: Bool = false
    
    public let isPostonly: Bool = false
}