//
//  SixBytes.swift
//  PacketReader
//
//  Created by Philip Shen on 3/10/18.
//  Copyright © 2018 Philip Shen. All rights reserved.
//

import Foundation

struct SixBytes {
    var bytes: [UInt8]
    
    init?(bytes: [UInt8]) {
        if bytes.count != 6 { return nil }
        self.bytes = bytes
    }
    
    func getValue() -> UInt64 {
        let extendedBytes = bytes + Array<UInt8>([0, 0])
        return UInt64(bytes: extendedBytes)!
    }
}
