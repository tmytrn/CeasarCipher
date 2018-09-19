import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String
    
    func decode(_ plaintext: String, secret: String) -> String
}



struct CeaserCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        var encoded = ""
        guard
            let shiftBy = UInt32(secret)
            else{
                return "Invalid secret value "
        }
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
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
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
}
