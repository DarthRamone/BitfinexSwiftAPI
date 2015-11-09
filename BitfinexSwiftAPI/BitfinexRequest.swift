//
//  BitfinexRequest.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation
import Alamofire

public protocol BitfinexRequest: URLRequestConvertible {
    
}

extension NSMutableURLRequest {
    
    var nonce: String {
        get {
            // Nothing to see here, move along
            var x = timeval()
            gettimeofday(&x, nil)
            
            let seconds: Int = x.tv_sec
            let millis: Int32 = x.tv_usec
            
            return "\(seconds)\(millis)000"
        }
    }

}