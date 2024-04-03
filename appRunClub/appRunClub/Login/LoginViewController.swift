//
//  LoginViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 22/03/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logInLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordForgotButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var dontHaveAnAccountLabel: UILabel!
    
    @IBOutlet weak var toSignUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabels()
        configButtons()
        configTextFields()
    }
    
    
    func configLabels() {
        // Text
        logInLabel.text = "Log In"
        emailLabel.text = "Email"
        passwordLabel.text = "Senha"
        dontHaveAnAccountLabel.text = "Não possui uma conta?"
        // Colors
        logInLabel.textColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
    }
    
    func configTextFields() {
        // Corner Radius
        emailTextField.layer.cornerRadius = 20.0
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderWidth = 1.0
        
        passwordTextField.layer.cornerRadius = 20.0
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 1.0
        // Keyboard Type
        emailTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .default
        // Security password
        passwordTextField.isSecureTextEntry = true
        
    }
    
    func configButtons() {
        //Setting Titles
        passwordForgotButton.setTitle("Esqueceu a senha?", for: .normal)
        submitButton.setTitle("Log In", for: .normal)
        toSignUpButton.setTitle("Sign Up", for: .normal)
        // Colors
        passwordForgotButton.setTitleColor(UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), for: .normal)
        submitButton.backgroundColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
        toSignUpButton.setTitleColor(UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), for: .normal)
        // Corner Radius
        submitButton.layer.cornerRadius = 20.0
        submitButton.clipsToBounds = true
        submitButton.layer.borderWidth = 1.0
        submitButton.tintColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
        submitButton.layer.borderColor = CGColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
            
    }
    
    func isValidEmail(_ email: String) -> Bool {
        return true
    }
    
    func isValidPassword(_ senha: String) -> Bool {
        return true
    }
    
    
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func tappedToSignUpButton(_ sender: UIButton) {
        
        guard let email = emailTextField.text, let senha = passwordTextField.text else {
            // Se nao houver nada nos campos, saia do método
            return
        }
        
        if isValidEmail(email) && isValidPassword(senha) {
            
            print("Login bem sucedido")
        } else {
            
            print("Email ou senha inválidos")
        }
        
        
        
        let paraSignUp = UIStoryboard(name: String(describing: SignUpViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: SignUpViewController.self))
        
        navigationController?.pushViewController(paraSignUp, animated: true)
    }
    

}
