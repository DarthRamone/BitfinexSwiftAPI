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

let baseURL = "https://api.bitfinex.com/v1"
let webSocketURL = "wss://api2.bitfinex.com:3000/ws"

public class Client {
    
    private let manager: Manager
    
    private let apiKey: String
    private let apiSecret: [UInt8]
    
    public init(apiKey: String, apiSecret: String) {
        
        self.apiKey = apiKey
        self.apiSecret = [UInt8](apiSecret.utf8)
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        manager = Alamofire.Manager(configuration: configuration)
    }

    public func ticker(completion: TickerResponse -> Void) {
        
        print("-- Starting TICKER method ---------------------------")
        
        manager.request(PublicRouter.Ticker(symbol: Symbol.BTCUSD))
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
        
        print("-- Starting SYMBOLS method ---------------------------")

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
    
    public func stats(completion: StatsResponse -> Void) {
        
        print("-- Starting STATS method ---------------------------")
        
        manager.request(PublicRouter.Stats(symbol: Symbol.BTCUSD))
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
        
        print("-- Starting ACCOUNT INFOS method ---------------------------")
        
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
        
        print("-- Starting DEPOSIT NEW method ---------------------------")
        
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
    
    public func fundingbook(completion: FundingbookResponse -> Void) {
        
        print("-- Starting FUNDINGBOOK method ---------------------------")
        
        manager.request(PublicRouter.Fundingbook(currency: Currency.BTC, limitBids: 3, limitAsks: 3))
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
        
        print("-- Starting ORDERBOOK method ---------------------------")
        
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
        
        print("-- Starting TRADES method ---------------------------")
        
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
        
        print("-- Starting LENDS method ---------------------------")
        
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
        
        print("-- Starting SYM DETAILS method ---------------------------")
        
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