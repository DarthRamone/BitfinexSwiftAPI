//
//  Client.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 04.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CryptoSwift
import Starscream

let baseURL = "https://api.bitfinex.com/v1"
let webSocketURL = "wss://api2.bitfinex.com:3000/ws"

public class Client {
    
    private let manager: Manager
    
    private let wsClient: WebSocketClient
    
    private var apiKey: String
    private var apiSecret: [UInt8]
    
    public init() {
        
        self.apiKey = ""
        self.apiSecret = [UInt8]()
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        manager = Alamofire.Manager(configuration: configuration)
        wsClient = WebSocketClient()
    }

    public func auth(apiKey: String, apiSecret: String) {
        self.apiKey = apiKey
        self.apiSecret = [UInt8](apiSecret.utf8)
    }
    
    public func new() {
        print("pew")
    }
    
    public func ticker(symbol: Symbol, completion: TickerResponse -> Void) {
        
        manager.request(PublicRouter.Ticker(symbol: symbol))
            .responseObject { (response: Response<TickerResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    public func symbols(completion: SymbolsResponse -> Void) {
        
        manager.request(PublicRouter.Symbols)
            .responseObject { (response: Response<SymbolsResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    public func stats(symbol: Symbol, completion: StatsResponse -> Void) {
        
        manager.request(PublicRouter.Stats(symbol: symbol))
            .responseObject { (response: Response<StatsResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    public func accountInfos(completion: AccountInfoResponse -> Void) {
        
        manager.request(BitfixAPI.AccountInfos)
            .responseObject { (response: Response<AccountInfoResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    public func depositNew(method: DepositMethod, wallet: WalletType, renew: Bool, completion: DepositNewResponse -> Void) {
        
        manager.request(BitfixAPI.Deposit(method: method, wallet: wallet, renew: renew))
            .responseObject { (response: Response<DepositNewResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    public func fundingbook(currency: Currency, limitBids: Int = 3, limitAsks: Int = 3, completion: FundingbookResponse -> Void) {
        
        manager.request(PublicRouter.Fundingbook(currency: Currency.BTC, limitBids: limitBids, limitAsks: limitAsks))
            .responseObject { (response: Response<FundingbookResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    public func orderbook(completion: OrderbookResponse -> Void) {
   
        manager.request(PublicRouter.Fundingbook(currency: Currency.BTC, limitBids: 3, limitAsks: 3))
            .responseObject { (response: Response<OrderbookResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    public func trades(completion: TradesResponse -> Void) {
        
        manager.request(PublicRouter.Trades(symbol: Symbol.BTCUSD, timestamp: nil, limitTrades: 5))
            .responseObject { (response: Response<TradesResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    public func lends(completion: LendsResponse -> Void) {
        
        manager.request(PublicRouter.Lends(currency: Currency.BTC, timestamp: nil, limitLends: 10))
            .responseObject { (response: Response<LendsResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }

    public func symbolsDetails(completion: SymbolsDetailsResponse -> Void) {

        manager.request(PublicRouter.SymbolsDetails)
            .responseObject { (response: Response<SymbolsDetailsResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    completion(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
}