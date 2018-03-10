//
//  UInt16_Extensions.swift
//  PacketReader
//
//  Created by Philip Shen on 3/10/18.
//  Copyright © 2018 Philip Shen. All rights reserved.
//

import Foundation

extension UInt16 {
    
    init?(bytes: [UInt8]) {
        if bytes.count != 2 { return nil }
        
        var value: UInt16 = 0
        for byte in bytes.reversed() {
            value = value << 8
            value = value | UInt16(byte)
        }
        
        self = value
    }
    
}
