//
//  CeaserCipherTests.swift
//  SpyAppTests
//
//  Created by Tommy Tran on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp
class CeaserCipherTests: XCTestCase {
    
    func testCeaserCipherEncodeAndDecode(){
        let cipher = CeaserCipher()
        let text = "test"
        let encoded = cipher.encode(text, secret: "1")
        let decoded = cipher.decode(encoded, secret: "1")
        
        XCTAssertEqual(text, decoded)
        
    }
    
    func testNullInputForCeaserCipher() {
        let cipher = CeaserCipher()
        let text = "a"
        let testCase = cipher.encode( text, secret: "")
        
        XCTAssertEqual("Invalid secret value ", testCase)
    }
    
    func testCeaserCipherStressfulInput(){
        let cipher = CeaserCipher()
        let text = "i got horses on my farm im a farmer"
        let encoded = cipher.encode(text, secret: "5")
        let decoded = cipher.decode(encoded, secret: "5")
        
        XCTAssertEqual(text, decoded)
    }
}


