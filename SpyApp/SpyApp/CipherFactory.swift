import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "AlphaNumericCeasar": AlphaNumericCeasarCipher(),
        "BadSecretCeasar": BadSecretCeasarCipther(),
        "ReverseCeasar": ReverseCeaserCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
