//
//  ViewModel.swift
//  appRunClub
//
//  Created by Nathalia Neves on 17/06/24.
//

import UIKit

class SignUpUserViewModel {
    
    private var passwordData = ""
    
    func validateName(_ name: String) -> Bool {
        return name.isEmpty
    }
    
    func validateEmail(_ email: String) -> Bool {
        if email.isEmpty || ((!email.localizedStandardContains("@")) || (!email.localizedStandardContains(".com"))) {
            return true
        } else {
            return false
        }
    }
    
    func validadePassword(_ password: String) -> Bool {
        passwordData = password
        return password.isEmpty || password.count < 6
    }
    
    func validateConfirmPassword(_ confirmPassword: String) -> Bool {
        return (confirmPassword != passwordData || confirmPassword.isEmpty)

    }
    
    public func validateData(name: String, email: String, password: String, confirmPassword: String) -> Bool {
        return (!validateName(name) && !validateEmail(email) && !validadePassword(password) && !validateConfirmPassword(confirmPassword))
    }
    
    public func getConfigTextFieldShouldReturn(textField: UITextField, nameTextField: UITextField, emailTextField: UITextField, passwordTextField: UITextField, confirmPasswordTextField: UITextField) -> Bool {
        
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
    }
}
