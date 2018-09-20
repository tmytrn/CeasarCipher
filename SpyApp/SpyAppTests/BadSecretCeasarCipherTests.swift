//
//  BadSecretCeasarCipherTests.swift
//  SpyAppTests
//
//  Created by Tommy Tran on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp
class BadSecretCeaserCipherTests: XCTestCase {
    
    func testBadSecretCipherEncodeAndDecode(){
        let cipher = BadSecretCeasarCipther()
        let text = "test"
        let encoded = cipher.encode(text, secret: "1")
        let decoded = cipher.decode(encoded, secret: "1")
        
        XCTAssertEqual(text, decoded)
        
    }
    
    func testNullInputForBadSecretCipher() {
        let badSecretCipher = BadSecretCeasarCipther()
        let text = "a"
        let testCase = badSecretCipher.encode( text, secret: "")
        
        XCTAssertEqual("Invalid secret value ", testCase)
    }
    
    func testBadSecretStressfulInput(){
        let cipher = BadSecretCeasarCipther()
        let text = "hamstrings"
        let encoded = cipher.encode(text, secret: "2")
        let decoded = cipher.decode(encoded, secret: "2")
        
        XCTAssertEqual(text, decoded)
    }
}


