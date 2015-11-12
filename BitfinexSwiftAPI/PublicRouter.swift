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
    
    public var URLRequest: NSMutableURLRequest {
        
        var path = ""
        
        switch self {
        case .Ticker(let symbol):
            path = "/v1/pubticker/" + symbol.rawValue
        case .Stats(symbol: let symbol):
            path = "/v1/stats/" + symbol.rawValue
        case .Symbols:
            path = "/v1/symbols"
        }
        
        let request = createRequest(path)
        return request
    }
    
    func createRequest(path: String) -> NSMutableURLRequest {
        
        let url = NSURL(string: self.baseURL)!
        let mutableURLRequest = NSMutableURLRequest(URL: url.URLByAppendingPathComponent(path))
        
        return mutableURLRequest
    }

}
