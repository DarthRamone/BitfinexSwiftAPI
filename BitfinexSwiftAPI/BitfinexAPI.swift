//
//  TickerRequest.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation
import SwiftyJSON
import CryptoSwift
import Alamofire

public enum BitfixAPI: BitfinexRouterProtocol {

    static let apiKey = "U59Zh82XI3WmHUvPQlpxCjaHm4wvw8VOVwf9pfQ2iuB"
    static let apiSecret = "ulIiAavfzRMoS2auTnMV98ZaWBl3NADROKMTGdJ6SdG"

    case AccountInfos
    case Deposit(method: DepositMethod, wallet: WalletType, renew: Bool)
    
    
    
    public var URLRequest: NSMutableURLRequest {
        
        var path = ""
        var payload: [String: AnyObject] = [ "nonce": nonce ]
        
        switch self {
        case .AccountInfos:
            path = "/v1/account_infos"
        case .Deposit(let method, let wallet, let renew):
            path = "/v1/deposit/new"
            payload["method"] = method.rawValue
            payload["wallet_name"] = wallet.rawValue
            payload["renew"] = renew ? 1 : 0
        }
        
       
        payload["request"] = path
        let request = createRequest(path, payload: payload)
        return request
    }

    func createRequest(path: String, payload: [String: AnyObject]) -> NSMutableURLRequest {
        
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

