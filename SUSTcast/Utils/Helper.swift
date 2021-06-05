//
//  Helper.swift
//  SUSTcast
//
//  Created by Abrar on 6/5/21.
//

import Foundation
import UIKit

class Helper{
    
    
    static func isPasswordValid(_ password : String) -> Bool{
        
        if password.count >= 8 {
            return true
        } else
        {
            return false
        }
        
    }
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func RoundButton(_ button: UIButton){
        button.layer.cornerRadius = 25.0
    }
    
    
}
