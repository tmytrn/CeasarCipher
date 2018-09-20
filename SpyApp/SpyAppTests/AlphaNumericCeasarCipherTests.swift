//
//  AlphaNumericCeasarCipherTests.swift
//  SpyAppTests
//
//  Created by Tommy Tran on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp
class AlphaNumericCeaserCipherTests: XCTestCase {
    func testAlphaNumericCeaserCipherEncodeAndDecode(){
        let cipher = AlphaNumericCeasarCipher()
        let text = "test"
        let encoded = cipher.encode(text, secret: "1")
        let decoded = cipher.decode(encoded, secret: "1")
        
        XCTAssertEqual(text, decoded)
        
    }
    func testNullInputForAlphaNumericCipher() {
        let alphaNumericCipher = AlphaNumericCeasarCipher()
        let text = "a"
        let testCase = alphaNumericCipher.encode( text, secret: "")
        
        XCTAssertEqual("Invalid secret value ", testCase)
    }
    func testAlphaNumericStressfulInput(){
        let cipher = AlphaNumericCeasarCipher()
        let text = "i got horses on my farm im a farmer"
        let encoded = cipher.encode(text, secret: "2")
        let decoded = cipher.decode(encoded, secret: "2")
        
        XCTAssertEqual(text, decoded)
    }
}
