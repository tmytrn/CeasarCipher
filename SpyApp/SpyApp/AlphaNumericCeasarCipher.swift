//
//  AlphaNumericCeasarCipher.swift
//  SpyApp
//
//  Created by Tommy Tran on 9/18/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct AlphaNumericCeasarCipher: Cipher {
    func encode(_ plaintext: String, secret: String) -> String {
        var encoded = ""
        guard
            let shiftBy = UInt32(secret)
            else{
                return "Invalid secret value "
        }
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            if(shiftedUnicode == 122){
                shiftedUnicode = 48 + (shiftBy - 1)
            }
            else if(shiftedUnicode == 57){
                shiftedUnicode = 97 + (shiftBy - 1)
            }else{
                shiftedUnicode = unicode + shiftBy
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
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            if(shiftedUnicode == 97){
                shiftedUnicode = 57 - (shiftBy - 1)
            }
            else if(shiftedUnicode == 48){
                shiftedUnicode = 122 - (shiftBy - 1)
            }else{
                shiftedUnicode = unicode - shiftBy
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}
