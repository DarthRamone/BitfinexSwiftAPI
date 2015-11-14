//
//  HistoricalDataRouter.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

internal enum HistoricalDataRouter: BitfinexRouterProtocol {
    
    case BalanceHistory(currency: Currency, since: NSDate?, until: NSDate?, limit: Int?, wallet: WalletType?)
    case DepositWithdrawalHistory(currency: Currency, method: DepositMethod?, since: NSDate?, until: NSDate?, limit: Int?)
    case PastTradesResponse(symbol: Symbol, timestamp: NSDate, until: NSDate?, limitTrades: Int?, reverse: Int?)
    
    internal var URLRequest: NSMutableURLRequest {
        
        let path: String
        var payload: [String: AnyObject] = [:]
        
        switch self {
        case .BalanceHistory(let currency, let since, let until, let limit, let wallet):
            path = "/v1/history"
            payload["currency"] = currency.rawValue
            if let since = since {
                payload["since"] = since.timeIntervalSince1970.description
            }
            if let until = until {
                payload["until"] = until.timeIntervalSince1970.description
            }
            if let limit = limit {
                payload["limit"] = limit
            }
            if let wallet = wallet {
                payload["wallet"] = wallet.rawValue
            }
        case .DepositWithdrawalHistory(let currency, let method, let since, let until, let limit):
            path = "/v1/history/movements"
            payload["currency"] = currency.rawValue
            if let method = method {
                payload["method"] = method.rawValue
            }
            if let since = since {
                payload["since"] = since.timeIntervalSince1970.description
            }
            if let until = until {
                payload["until"] = until.timeIntervalSince1970.description
            }
            if let limit = limit {
                payload["limit"] = limit
            }
        case .PastTradesResponse(let symbol, let timestamp, let until, let limitTrades, let reverse):
            path = "/v1/mytrades"
            payload["symbol"] = symbol.rawValue
            payload["timestamp"] = timestamp.timeIntervalSince1970.description
            if let until = until {
                payload["until"] = until.timeIntervalSince1970.description
            }
            if let limitTrades = limitTrades {
                payload["limit_trades"] = limitTrades
            }
            if let reverse = reverse {
                payload["reverse"] = reverse
            }
        }
        
        
        
        payload["request"] = path
        let request = createRequest(path, payload: payload)
        return request
    }

    
    internal func createRequest(path: String, payload: [String: AnyObject]) -> NSMutableURLRequest {
        
        let url = NSURL(string: self.baseURL)!
        let mutableURLRequest = NSMutableURLRequest(URL: url.URLByAppendingPathComponent(path))
        
        mutableURLRequest.HTTPMethod = "POST"
        
        let payloadEnc = payload.encrypted
        let signature = payloadEnc.hmacSign(BitfixAPI.apiSecret)
        
        let headers = [
            "X-BFX-APIKEY": BitfixAPI.apiKey,
            "X-BFX-PAYLOAD": payloadEnc,
            "X-BFX-SIGNATURE": signature
        ]
        
        mutableURLRequest.addHeaders(headers)
        
        return mutableURLRequest
    }

}