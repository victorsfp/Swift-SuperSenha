//
//  PasswordsGenerator.swift
//  SuperSenha
//
//  Created by Victor Feitosa on 13/12/21.
//

import Foundation

class PasswordsGenerator {
    var numberOfCharacters: Int
    var numberOfPasswords: Int
    var useLetter: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharecters: Bool!
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let number = "0123456789"
    private let specialCharacters = "!@#$%&*()_-+=~`|]}[{':;?/<>.,"
    
    init(numberOfCharacters: Int, numberOfPasswords: Int, useLetter: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharecters: Bool) {
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
            
            
        self.numberOfCharacters = numchars
        self.numberOfPasswords = numberOfPasswords
        self.useLetter = useLetter
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharecters = useSpecialCharecters
    }
    
    func generate(total: Int) -> [String]{
        passwords.removeAll()
        var universe: String = ""
        
        if useLetter {
            universe += letters
        }
        
        if useNumbers {
            universe += number
        }
        
        if useSpecialCharecters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters{
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
}
