//
//  WebSocketClient.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 14.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON
import Starscream

internal class WebSocketClient {
    
    private let tickerSocket: WebSocket
    private let tradesSocket: WebSocket
    private let bookSocket:   WebSocket
    
    // List of subscribed channels
    private var channels: [Int: WsChannelType] = [Int: WsChannelType]()
    
    internal init() {
        
        let url = NSURL(string: "wss://api2.bitfinex.com:3000/ws")!
        
        tickerSocket = WebSocket(url: url)
        tradesSocket = WebSocket(url: url)
        bookSocket   = WebSocket(url: url)
        
        tickerSocket.delegate = TickerChannelDelegate(socket: tickerSocket)
        tickerSocket.connect()
        
    }
    
    private class TickerChannelDelegate: WebSocketDelegate {
        
        private let socket: WebSocket
        
        init(socket: WebSocket) {
            self.socket = socket
        }
        
        private func websocketDidConnect(socket: WebSocket) {
            
            print("-------------- Ticker socket connected ------------------")
            socket.writeString("{ \"event\": \"subscribe\", \"channel\": \"ticker\", \"pair\": \"btcusd\" }")
        }
        
        private func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
            print("-------------- Ticker socket disconnected ---------------")
        }
        
        private func websocketDidReceiveMessage(socket: WebSocket, text: String) {
            print("-------------- Ticker message received ------------------")
            print("Message: \(text)")
        }
        
        private func websocketDidReceiveData(socket: WebSocket, data: NSData) {
            print("-------------- Ticker received date ---------------------")
        }
        
    }
    
    
    
    private class BookChannelDelegate: WebSocketDelegate {
        private func websocketDidConnect(socket: WebSocket) {
        }
        private func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        }
        private func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        }
        private func websocketDidReceiveData(socket: WebSocket, data: NSData) {
        }
    }
    
    private class TradesChannelDelegate: WebSocketDelegate {
        private func websocketDidConnect(socket: WebSocket) {
        }
        private func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        }
        private func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        }
        private func websocketDidReceiveData(socket: WebSocket, data: NSData) {
        }
    }
}
