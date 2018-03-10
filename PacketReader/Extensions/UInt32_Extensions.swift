//
//  UInt32_Extensions.swift
//  PacketReader
//
//  Created by Philip Shen on 3/10/18.
//  Copyright © 2018 Philip Shen. All rights reserved.
//

import Foundation

extension UInt32 {
    
    init?(bytes: [UInt8]) {
        if bytes.count != 4 { return nil }
        
        var value: UInt32 = 0
        for byte in bytes.reversed() {
            value = value << 8
            value = value | UInt32(byte)
        }
        
        self = value
    }
    
}
