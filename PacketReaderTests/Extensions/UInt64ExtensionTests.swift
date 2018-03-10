//
//  UInt64ExtensionTests.swift
//  PacketReaderTests
//
//  Created by Philip Shen on 3/10/18.
//  Copyright © 2018 Philip Shen. All rights reserved.
//

@testable import PacketReader
import XCTest

class UInt64ExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitWithUInt8Array() {
        // Given
        let expectedOutput: UInt64 = 513
        let input: [UInt8] = [1, 2, 0, 0, 0, 0, 0, 0]
        
        // When
        let actualOutput = UInt64(bytes: input)
        
        // Then
        XCTAssertEqual(expectedOutput, actualOutput!, "Initializing with [UInt8] should return the correct value")
    }
    
}
