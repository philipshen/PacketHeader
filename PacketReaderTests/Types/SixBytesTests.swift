//
//  SixBytesTests.swift
//  PacketReaderTests
//
//  Created by Philip Shen on 3/10/18.
//  Copyright © 2018 Philip Shen. All rights reserved.
//

@testable import PacketReader
import XCTest

class SixBytesTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetValue() {
        // Given
        let inputBytes: [UInt8] = [1, 2, 0, 0, 0, 0]
        let sixBytes = SixBytes(bytes: inputBytes)
        let expectedOutput: UInt64 = 513
        
        // When
        let actualOutput = sixBytes!.getValue()
        
        // Then
        XCTAssertEqual(actualOutput, expectedOutput, "getValue() shoudn return the correct value as a long")
    }
    
}
