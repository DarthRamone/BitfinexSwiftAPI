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

    public func ticker(closure: (pair: Pair?) -> Void) {
        
        var pair: Pair? = nil

        manager.request(.GET, baseURL + "/pubticker/BTCUSD")
            .responseJSON(options: NSJSONReadingOptions.MutableContainers) { response in
                
                switch response.result {
                case .Success:
                    var json = JSON(response.data!)
                    pair = Pair()
                    if let pair = pair {
                        pair.mid = json["mid"].floatValue
                        pair.bid = json["bid"].floatValue
                        pair.ask = json["ask"].floatValue
                        closure(pair: pair)
                    }
                case .Failure(let error):
                    print(error)
                    closure(pair: nil)
                }
        }
    }
    
    public func symbols(closure: (symbols: [String]) -> Void) {
        
        var result: [String] = [String]()
        
        manager.request(.GET, baseURL + "/symbols")
            .responseJSON(options: NSJSONReadingOptions.MutableContainers) { response in
                
                switch response.result {
                case .Success:

                    let json = JSON(data: response.data!)
                    
                    result = json.arrayValue.map{ $0.stringValue }
                    
                    closure(symbols: result)
                    
                case .Failure(let error):
                    print(error)
                    closure(symbols: result)
                }
        }
    }
    
    public func stats(symbol: String, closure: (stats: [Stats]) -> Void) {
        
        var result: [Stats] = [Stats]()
        
        manager.request(.GET, baseURL + "/stats/" + symbol)
            .responseJSON(options: NSJSONReadingOptions.MutableContainers) { response in
                
                switch response.result {
                case .Success:
                    
                    let json = JSON(data: response.data!)
                    
                    result = json.arrayValue.map{
                        
                        let elem = Stats()

                        elem.period = $0["period"].intValue
                        elem.volume = $0["volume"].floatValue
                        
                        return elem
                    }
                    
                    closure(stats: result)
                    
                case .Failure(let error):
                    print(error)
                    closure(stats: result)
                }
        }
    }
    
    public func accountInfos() {
        
        manager.request(BitfixAPI.AccountInfos)
            .responseObject { (response: Response<AccountInfoResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    print(result)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
    public func depositNew(method: DepositMethod, wallet: WalletType, renew: Bool = false) {
        
        manager.request(BitfixAPI.Deposit(method: method, wallet: wallet, renew: renew))
            .responseObject { (response: Response<DepositNewResponse, NSError>) in
                switch response.result {
                case .Success(let result):
                    print(result)
                case .Failure(let error):
                    print(error)
                }
        }
        
    }
    
    
    func getNonce() -> String {
        // Nothing to see here, move along
        var x = timeval()
        gettimeofday(&x, nil)

        let seconds: Int = x.tv_sec
        let millis: Int32 = x.tv_usec
        
        return "\(seconds)\(millis)000"
    }
    
    func encryptPayload(payload: [String: String]) -> String {
        
        let json = JSON(payload).rawString()!
        let byteArray = json.utf8.map({ $0 as UInt8 })
        let data = NSData(bytes: byteArray)
        let result = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.EncodingEndLineWithCarriageReturn)
        return result
        
    }
    
    func signed(payloadEnc: String) -> String {
    
        let msg = [UInt8](payloadEnc.utf8)
        let hmac = try! Authenticator.HMAC(key: apiSecret, variant: .sha384).authenticate(msg)
        let signature = hmac.map { return ( $0 < 16 ? "0" : "" ) + (String($0, radix: 16, uppercase: false)) }.reduce("", combine: { $0 + $1 })
        return signature
        
    }
}