//
//  NonceProvider.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 13.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

internal class NonceProvider {
    
    static let sharedInstanse = NonceProvider()
    
    private var timestamp: Int
    
    internal var nonce: Int {
        get { return timestamp++ }
    }
    
    private init() {
        // Nothing to see here, move along
        var x = timeval()
        gettimeofday(&x, nil)
            
        let seconds: Int = x.tv_sec
        let millis: Int32 = x.tv_usec
            
        timestamp = Int("\(seconds)\(millis)000")!
    }
}
