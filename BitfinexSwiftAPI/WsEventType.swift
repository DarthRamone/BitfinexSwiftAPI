//
//  WsEventType.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 14.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

public enum WsEventType: String {
    
    case Subscribe = "subscribe"
    
    case Subscribed = "subscribed"
    
    case Info = "info"
    
    case Ping = "ping"
    
    case Pong = "pong"
    
    case Error = "error"
    
    case Unsubscribe = "unsubscribe"
    
    case Unsubscribed = "unsubscribed"
    
    case Auth = "auth"
    
    case UnAuth = "unauth"
    
}
