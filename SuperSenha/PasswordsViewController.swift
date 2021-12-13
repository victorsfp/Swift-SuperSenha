//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Victor Feitosa on 13/12/21.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetter: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharecters: Bool!
    
    var passwordsGenerator: PasswordsGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Total de Senhas:  \(numberOfPasswords)"
        passwordsGenerator = PasswordsGenerator(numberOfCharacters: numberOfCharacters, numberOfPasswords: numberOfPasswords, useLetter: useLetter, useNumbers: useNumbers,useCapitalLetters: useCapitalLetters, useSpecialCharecters: useSpecialCharecters)
        generatePasswords()
        
    }
    
    func generatePasswords(){
        tvPasswords.scrollRangeToVisible(_NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordsGenerator.generate(total: numberOfPasswords)
        
        for password in passwords {
            tvPasswords.text.append(password+"\n\n")
        }
    }
    
    @IBAction func generate(_ sender: Any) {
        generatePasswords()
    }
    
}
