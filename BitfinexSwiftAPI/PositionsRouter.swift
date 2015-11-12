//
//  PositionsRouter.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

public enum PositionsRouter: BitfinexRouterProtocol {
    
    case ActivePositions
    case ClaimPosition(id: Int)
    
    
    public var URLRequest: NSMutableURLRequest {
    
        let path: String
        var payload: [String: AnyObject] = [:]

        switch self {
        case .ActivePositions:
            path = "/v1/positions"
        case .ClaimPosition(let id):
            path = "/v1/position/claim"
            payload["position_id"] = id
        }
        
        
        
        payload["request"] = path
        let request = createRequest(path, payload: payload)
        return request
    }
    
    
    public func createRequest(path: String, payload: [String: AnyObject]) -> NSMutableURLRequest {
        
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
