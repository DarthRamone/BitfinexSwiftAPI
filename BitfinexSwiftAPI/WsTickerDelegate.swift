//
//  WsTickerDelegate.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 15.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

public protocol WsTickerDelegateProtocol {
    func messageReceived(msg: WsTickerMessage) -> Void
}
