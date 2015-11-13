//
//  BitfinexRouterProtocol.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Alamofire

public protocol BitfinexRouterProtocol: URLRequestConvertible {
    
    var baseURL: String { get }
    
    func createRequest(path: String, payload: [String: AnyObject]) -> NSMutableURLRequest
    
}

extension BitfinexRouterProtocol {
    
    public var baseURL: String {
        get { return "https://api.bitfinex.com" }
    }
}