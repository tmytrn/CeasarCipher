import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    
    let factory = CipherFactory()
    var cipher: Cipher?
    
    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }
    
    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        if let cipher = self.cipher {
            output.text = cipher.encode(plaintext, secret: secretText)
        } else {
            output.text = "No cipher selected"
        }
    }
    @IBAction func decodeButtonPressed(_ sender: Any) {
        if let cipher = self.cipher {
            output.text = cipher.decode(plaintext, secret: secretText)
        } else {
            output.text = "No cipher selected"
        }
    }
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
        else {
            output.text = "No button or no button text"
            return
        }
        cipher = factory.cipher(for: buttonText)
    }
    @IBAction func AlphaNumericButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button text"
                return
        }
        cipher = factory.cipher(for: buttonText)
    }
    @IBAction func BadSecretButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button text"
                return
        }
        cipher = factory.cipher(for: buttonText)
    }
    @IBAction func ReverseButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button text"
                return
        }
        cipher = factory.cipher(for: buttonText)
    }

}

