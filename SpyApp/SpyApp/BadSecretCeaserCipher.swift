//
//  BadSecretCeaser.swift
//  SpyApp
//
//  Created by Tommy Tran on 9/17/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct BadSecretCeasarCipther: Cipher {
    func encode(_ plaintext: String, secret: String) -> String {
        var encoded = ""
        guard
            let shiftBy = UInt32(secret)
            else{
                return "Invalid secret value "
        }
        for character in plaintext.lowercased() {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            if(unicode == 122){
                shiftedUnicode = 97 + (shiftBy * 2)
            }
            else {
                shiftedUnicode = unicode + (shiftBy * 2)
                if(shiftedUnicode > 122){
                    shiftedUnicode = 97 + (shiftedUnicode - 122)
                }
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    func decode(_ plaintext: String, secret: String) -> String {
        var decoded = ""
        guard
            let shiftBy = UInt32(secret)
            else{
                return "Invalid secret value "
        }
        
        for character in plaintext.lowercased() {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            if(unicode == 97){
                shiftedUnicode = 122 - (shiftBy * 2)
            }
            else {
                shiftedUnicode = unicode - (shiftBy * 2)
                if(shiftedUnicode < 97){
                    shiftedUnicode = 122 - (97 - shiftedUnicode )
                }
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
    
    
}
