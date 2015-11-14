//
//  Extensions.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation
import SwiftyJSON
import CryptoSwift

extension NSMutableURLRequest {
    
    func addHeaders(headers: [String: String]) {
        for (key, value) in headers {
            self.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    func addPayload(payload: [String: String], apiKey: String, apiSecret: String) {
            }
}

extension String {
    
    var base64: String {
        let byteArray = self.utf8ByteArray
        let data = NSData(bytes: byteArray)
        let result = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.EncodingEndLineWithCarriageReturn)
        return result
    }
    
    var utf8ByteArray: [UInt8] {
        return [UInt8](self.utf8)
    }
    
    func hmacSign(key: String) -> String {
        let hmac = try! Authenticator.HMAC(key: key.utf8ByteArray, variant: .sha384).authenticate(self.utf8ByteArray)
        let signature = hmac.map { return ( $0 < 16 ? "0" : "" ) + (String($0, radix: 16, uppercase: false)) }.reduce("", combine: { $0 + $1 })
        return signature
    }
    
}

extension Dictionary where Key: StringLiteralConvertible, Value: AnyObject {
    public var encrypted: String {
        get {
            
            var res: [String: AnyObject] = [:]
            for (key, value) in self {
                
                res[String(key)] = value
            }
            
            return res.jsonRepresentation.base64
        }
    }
    
}

extension Dictionary where Key: StringLiteralConvertible, Value: AnyObject {
    
    public var jsonRepresentation: String {
        get {
            var res: [String: AnyObject] = [:]
            for (key, value) in self {
                res[String(key)] = value
            }
            let json = JSON(res).rawString()!
            return json
        }
    }
    
}