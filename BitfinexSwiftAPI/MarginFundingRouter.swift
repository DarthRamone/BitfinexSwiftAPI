//
//  MarginFundingRouter.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import SwiftyJSON

public enum MarginFundingRouter: BitfinexRouterProtocol {

    case NewOffer(currency: Currency, amount: Float, rate: Float, period: Int, direction: FundingDirection)
    case CancelOffer(id: Int)
    case OfferStatus(id: Int)
    case ActiveCredits
    case ActiveFunding
    case CloseMarginFunding(swapId: Int)
    
    public var URLRequest: NSMutableURLRequest {
        
        var path: String
        var payload: [String: AnyObject] = [:]
        
        switch self {
            
        case .NewOffer(let currency, let amount, let rate, let period, let direction):
            path = "/v1/offer/new"
            payload["currency"] = currency.rawValue
            payload["amount"] = amount
            payload["rate"] = rate
            payload["period"] = period
            payload["direction"] = direction.rawValue
        case .CancelOffer(let id):
            path = "/v1/offer/cancel"
            payload["offer_id"] = id
        case .OfferStatus(let id):
            path = "/v1/offer/status"
            payload["offer_id"] = id
        case .ActiveCredits:
            path = "/v1/offers"
        case .ActiveFunding:
            path = "/v1/taken_funds"
        case .CloseMarginFunding(let id):
            path = "/v1/funding/close"
            payload["swap_id"] = id
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