//
//  ResponseType.swift
//  BitfinexSwiftAPI
//
//  Created by Alexander Moshkin on 07.11.15.
//  Copyright © 2015 DarthRamone. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol ResponseObjectSerializable {
    init?(json: JSON) throws
}