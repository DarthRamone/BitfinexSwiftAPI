//
//  NonceProvider.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

internal class NonceProvider {
    
    static let sharedInstanse = NonceProvider()
    
    var timestamp: Int
    
    internal var nonce: String {
        get {
            return "\(self.timestamp++)"
        }
    }
    
    init() {
        // Nothing to see here, move along
        var x = timeval()
        gettimeofday(&x, nil)
            
        let seconds: Int = x.tv_sec
        let millis: Int32 = x.tv_usec
            
        self.timestamp = Int("\(seconds)\(millis)000")!
    }
}
