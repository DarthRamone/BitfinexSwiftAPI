//
//  OrdersRouter.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 12.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

public enum OrdersRouter: BitfinexRouterProtocol {
    
    case NewOrder(params: NewOrderParams)
    case NewMultiOrders(params: [NewOrderParams])
    case CancelOrder(id: Int)
    case CancelMultipleOrders(ids: [Int])
    case CancellAllOrders
    case ReplaceOrder(params: ReplaceOrderParams)
    case OrderStatus(id: Int)
    case ActiveOrders
    
    public var URLRequest: NSMutableURLRequest {
        
        var path = ""
        var payload: [String: AnyObject] = [ "nonce": NonceProvider.sharedInstanse.nonce ]
        
        switch self {
        case .NewOrder(let params):
            path = "/v1/order/new"
            payload["symbol"] = params.symbol.rawValue
            payload["amount"] = params.amount
            payload["price"] = params.price
            payload["exchange"] = params.exchange
            payload["side"] = params.side.rawValue
            payload["type"] = params.type.rawValue
            payload["is_hidden"] = params.isHidden
            payload["is_postonly"] = params.isPostonly
        case .NewMultiOrders(let params):
            path = "/v1/order/new/multi"
            payload["orders"] = params.map { orderParams in
                return [ "symbol":     orderParams.symbol.rawValue,
                         "amount":     orderParams.amount,
                         "price":      orderParams.price,
                         "exchange":   orderParams.exchange,
                         "side":       orderParams.side.rawValue,
                         "type":       orderParams.type.rawValue,
                         "is_hidden":  orderParams.isHidden,
                         "is_postonly":orderParams.isPostonly
                ]
            }
        case .CancelOrder(let id):
            path = "/v1/order/cancel"
            payload["order_id"] = id
        case .CancelMultipleOrders(let ids):
            path = "/v1/order/cancel/multi"
            payload["order_ids"] = ids
        case .CancellAllOrders:
            path = "/v1/order/cancel/all"
        case .ReplaceOrder(let params):
            path = "/v1/order/replace"
            payload["order_id"] = params.id
            payload["symbol"] = params.symbol.rawValue
            payload["amount"] = params.amount
            payload["price"] = params.price
            payload["exchange"] = params.exchange
            payload["side"] = params.side.rawValue
            payload["type"] = params.type.rawValue
            payload["is_hidden"] = params.isHidden
        case .OrderStatus(let id):
            path = "/v1/order/status"
            payload["order_id"] = id
        case .ActiveOrders:
            path = "/v1/orders"
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
