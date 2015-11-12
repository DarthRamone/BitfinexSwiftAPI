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
}