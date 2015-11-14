//
//  WsResponse.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 14.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

//import

public protocol WsResponse {
    
    var eventType: WsEventType { get }
    
}