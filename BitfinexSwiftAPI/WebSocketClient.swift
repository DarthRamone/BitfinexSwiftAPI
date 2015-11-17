//
//  WebSocketClient.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 14.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON
import Starscream

internal class WebSocketClient: WebSocketDelegate {
    
    let url = NSURL(string: "wss://api2.bitfinex.com:3000/ws")!
    
    private let tickerSocket: WebSocket
    
    private var channels: [Int: Symbol] = [:]
    
    internal let tickerDelegate: WsTickerDelegateProtocol
    
    internal init(tickerDelegate: WsTickerDelegateProtocol) {

        self.tickerDelegate = tickerDelegate
        
        tickerSocket = WebSocket(url: url)
        print("---------- Initializing WebSockets --------------------")
        
        tickerSocket.delegate = self//TickerChannelDelegate(socket: tickerSocket)
        tickerSocket.connect()
    }
    
    internal func websocketDidConnect(socket: WebSocket) {
        
        print("-------------- Ticker socket connected ------------------")
        tickerSocket.writeString("{ \"event\": \"subscribe\", \"channel\": \"ticker\", \"pair\": \"btcusd\" }")
        tickerSocket.writeString("{ \"event\": \"subscribe\", \"channel\": \"ticker\", \"pair\": \"ltcusd\" }")
    }
    
    internal func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("-------------- Ticker socket disconnected ---------------")
    }
    
    internal func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("-------------- Ticker message received ------------------")
        
        let data = text.dataUsingEncoding(NSUTF8StringEncoding)!
        let json = JSON(data: data)

        if let _ = json.array {
            print("---------------- JSON IS ARRAY -------------------")
            var msg = try! WsTickerMessage(json: json)
            msg.symbol = channels[msg.channelId]
            
            tickerDelegate.messageReceived(msg)
            
        } else {
            print("---------------- JSON NOT ARRAY -------------------")
            if let dict = json.dictionary {
                if dict["event"] != "info" {
                    channels[(dict["chanId"]?.intValue)!] = Symbol(string: (dict["pair"]?.stringValue)!)
                }
            }
            
        }
    }
    
    internal func websocketDidReceiveData(socket: WebSocket, data: NSData) {
        print("-------------- Ticker received date ---------------------")
    }

}
