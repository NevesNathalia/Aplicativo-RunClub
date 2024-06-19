//
//  ViewModel.swift
//  appRunClub
//
//  Created by Nathalia Neves on 17/06/24.
//

import UIKit

class LoginViewModel {
    
  
    public func validadeEmail(_ email: String) -> Bool {
        if email.isEmpty || ((!email.localizedStandardContains("@")) || (!email.localizedStandardContains(".com"))) {
            return false
        } else {
            return true
        }
    }
    
    public func validadePassword(_ password: String) -> Bool {
        return !(password.count < 6)
    }
    
    public func getTextFieldShouldReturn(textField: UITextField, emailTextField: UITextField, passwordTextField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
           textField.resignFirstResponder()
        }
        return true
    }
    
}
