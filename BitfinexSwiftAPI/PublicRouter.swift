//
//  PublicRouter.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

public enum PublicRouter: BitfinexRouterProtocol {
    
    case Ticker(symbol: Symbol)
    case Stats(symbol: Symbol)
    case Symbols
    case Fundingbook(currency: Currency, limitBids: Int, limitAsks: Int)
    case Orderbook(symbol: Symbol, limitBids: Int, limitAsks: Int, group: Bool)
    case Trades(symbol: Symbol, timestamp: NSDate?, limitTrades: Int)
    case Lends(currency: Currency, timestamp: NSDate?, limitLends: Int)
    case SymbolsDetails
    
    
    public var URLRequest: NSMutableURLRequest {
        
        let path: String
        var payload: [String: AnyObject] = [:]
        
        switch self {
            
        case .Ticker(let symbol):
            path = "/v1/pubticker/" + symbol.rawValue
        case .Stats(symbol: let symbol):
            path = "/v1/stats/" + symbol.rawValue
        case .Symbols:
            path = "/v1/symbols"
        case .Fundingbook(let currency, let limitBids, let limitAsks):
            path = "/v1/lendbook/" + currency.rawValue
            payload = [
                "limit_bids": limitBids,
                "limit_asks": limitAsks
            ]
        case .Orderbook(let symbol, let limitBids, let limitAsks, let group):
            path = "/v1/book/" + symbol.rawValue
            payload = [
                "limit_bids": limitBids,
                "limit_asks": limitAsks,
                "group":      group.hashValue
            ]
        case .Trades(let symbol, let timestamp, let limitTrades):
            path = "/v1/trades/" + symbol.rawValue
            payload["limit_trades"] = limitTrades
            if let tstamp = timestamp {
                payload["timestamp"] = tstamp.timeIntervalSince1970.description
            } else {
                payload["timestamp"] = false
            }
        case .Lends(let currency, let timestamp, let limitLends):
            path = "/v1/lends/" + currency.rawValue
            payload["limit_lends"] = limitLends
            if let tstamp = timestamp {
                payload["timestamp"] = tstamp.timeIntervalSince1970.description
            } else {
                payload["timestamp"] = false
            }
        case .SymbolsDetails:
            path = "/v1/symbols_details"
            
        }
        
        let request = createRequest(path, payload: payload)
        return request
        
    }
    
    public func createRequest(path: String, payload: [String: AnyObject]) -> NSMutableURLRequest {
        
        let strUrl: String = baseURL + path + "?" + payload.map { key, value in "\(key)=\(String(value))" }.joinWithSeparator("&")
        
        let url = NSURL(string: strUrl)!
        
        let mutableURLRequest = NSMutableURLRequest(URL: url)
        
        return mutableURLRequest
    }

}
