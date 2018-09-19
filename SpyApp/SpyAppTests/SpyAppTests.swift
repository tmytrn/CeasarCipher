//
//  SpyAppTests.swift
//  SpyAppTests
//
//  Created by Axel Ancona Esselmann on 8/30/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class SpyAppTests: XCTestCase {
    
    func testCeaserCipherEncodeAndDecode(){
        let cipher = CeaserCipher()
        let text = "test"
        let encoded = cipher.encode(text, secret: "1")
        let decoded = cipher.decode(encoded, secret: "1")
        
        XCTAssertEqual(text, decoded)
        
    }
    func testAlphaNumericCeaserCipherEncodeAndDecode(){
        let cipher = AlphaNumericCeasarCipher()
        let text = "test"
        let encoded = cipher.encode(text, secret: "1")
        let decoded = cipher.decode(encoded, secret: "1")
        
        XCTAssertEqual(text, decoded)
        
    }
    func testBadSecretCipherEncodeAndDecode(){
        let cipher = BadSecretCeasarCipther()
        let text = "test"
        let encoded = cipher.encode(text, secret: "1")
        let decoded = cipher.decode(encoded, secret: "1")
        
        XCTAssertEqual(text, decoded)
        
    }
    func testReverseCipherEncodeAndDecode(){
        let cipher = ReverseCeaserCipher()
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
    func testNullInputForBadSecretCipher() {
        let badSecretCipher = BadSecretCeasarCipther()
        let text = "a"
        let testCase = badSecretCipher.encode( text, secret: "")
        
        XCTAssertEqual("Invalid secret value ", testCase)
    }
    func testNullInputForAlphaNumericCipher() {
        let alphaNumericCipher = AlphaNumericCeasarCipher()
        let text = "a"
        let testCase = alphaNumericCipher.encode( text, secret: "")
        
        XCTAssertEqual("Invalid secret value ", testCase)
    }
    func testNullInputForReverseCipher() {
        let reverseCipher = ReverseCeaserCipher()
        let text = "a"
        let testCase = reverseCipher.encode( text, secret: "")
        
        XCTAssertEqual("Invalid secret value ", testCase)
    }
    

    
}
