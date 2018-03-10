//
//  ExamplePacketHeaderTests.swift
//  PacketReaderTests
//
//  Created by Philip Shen on 3/10/18.
//  Copyright © 2018 Philip Shen. All rights reserved.
//

@testable import PacketReader
import XCTest

class ExamplePacketHeaderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitWithData() {
        // Given
        let inputBytes: [UInt8] = [1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0]
        let inputData = NSData(bytes: inputBytes, length: 16)
        
        // When
        let sut = ExamplePacketHeader(data: inputData)
        
        // Then
        XCTAssertEqual(sut!.version, UInt16(1), "Version should be correctly initialized")
        XCTAssertEqual(sut!.destination, UInt8(1), "Destination should be correctly initialized")
        XCTAssertEqual(sut!.source, UInt8(1), "Source should be correctly initialized")
        XCTAssertEqual(sut!.flags, UInt16(1), "Flags should be correctly initialized")
        XCTAssertEqual(sut!.ttk, UInt32(1), "TTK should be correctly initialized")
        XCTAssertEqual(sut!.syn.getValue(), SixBytes(bytes: [1, 0, 0, 0, 0, 0] as [UInt8])!.getValue(), "SYN should be correctly initialized")
        
    }
    
}
