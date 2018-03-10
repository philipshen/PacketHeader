//
//  ExamplePacketHeader.swift
//  PacketReader
//
//  Created by Philip Shen on 3/10/18.
//  Copyright © 2018 Philip Shen. All rights reserved.
//

import Foundation

struct ExamplePacketHeader {
    
    var version: UInt16
    var destination: UInt8
    var source: UInt8
    var flags: UInt16
    var ttk: UInt32
    var syn: SixBytes
    
    init(version: UInt16, destination: UInt8, source: UInt8, flags: UInt16, ttk: UInt32, syn: SixBytes) {
        self.version = version
        self.destination = destination
        self.source = source
        self.flags = flags
        self.ttk = ttk
        self.syn = syn
    }
    
    init?(versionBytes: [UInt8], destination: UInt8, source: UInt8, flagsBytes: [UInt8], ttkBytes: [UInt8], synBytes: [UInt8]) {
        if let version = UInt16(bytes: versionBytes),
           let flags = UInt16(bytes: flagsBytes),
           let ttk = UInt32(bytes: ttkBytes),
            let syn = SixBytes(bytes: synBytes) {
            self.init(version: version, destination: destination, source: source, flags: flags, ttk: ttk, syn: syn)
        } else {
            return nil
        }
    }
    
    init?(data: NSData) {
        if data.length != PacketConstants.PACKET_HEADER_SIZE { return nil }
        
        let bytes = Array(UnsafeBufferPointer(start: data.bytes.assumingMemoryBound(to: UInt8.self), count: data.length))
        self.init(versionBytes: Array(bytes[0..<2]),
                  destination: bytes[3],
                  source: bytes[4],
                  flagsBytes: Array(bytes[4..<6]),
                  ttkBytes: Array(bytes[6..<10]),
                  synBytes: Array(bytes[10..<16]))
    }
    
    
}
