//
//  LoginViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 22/03/24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logInLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordForgotButton: UIButton!
    @IBOutlet weak var invalidLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var dontHaveAnAccountLabel: UILabel!
    @IBOutlet weak var toSignUpButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabels()
        configButtons()
        configTextFields()
        self.auth = Auth.auth()
    }
    
    func configLabels() {
        // Text
        logInLabel.text = "Log In"
        emailLabel.text = "Email"
        passwordLabel.text = "Senha"
        invalidLabel.text = ""
        dontHaveAnAccountLabel.text = "Não possui uma conta?"
        // Colors
        logInLabel.textColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
        // Font
        logInLabel.font = UIFont.systemFont(ofSize: 30.0, weight: .semibold)
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
        toSignUpButton.setTitle("Cadastre-se", for: .normal)
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
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        let resetPasword = UIStoryboard(name: String(describing: ResetPasswordViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ResetPasswordViewController.self)) as? ResetPasswordViewController
        
        navigationController?.pushViewController(resetPasword ?? UIViewController(), animated: true)
        
    }
    
    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty else {
               showAlert(title: "Atenção!", message: "O campo de e-mail está vazio.")
               return
           }
           
           guard let password = passwordTextField.text, !password.isEmpty else {
               showAlert(title: "Atenção!", message: "O campo de senha está vazio.")
               return
           }
        
        self.auth?.signIn(withEmail: email, password: password, completion: { usuario, error in
            
            if error != nil {
                self.showAlert(title: "Erro ao Logar", message: "Verifique se os dados estão corretos")
            } else {
                if usuario == nil {
                    self.emailTextField.layer.borderWidth = 1.0
                    self.emailTextField.layer.borderColor = UIColor.red.cgColor
                    self.passwordTextField.layer.borderWidth = 1.0
                    self.passwordTextField.layer.borderColor = UIColor.red.cgColor
                    self.invalidLabel.text = "Usuário inválido."
                } else {
                    let tabBar = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController
                    
                    self.navigationController?.pushViewController(tabBar ?? UIViewController(), animated: true)
                }
            }
        })
        
    }
    
    @IBAction func tappedToSignUpButton(_ sender: UIButton) {
        let signUp = UIStoryboard(name: String(describing: SignUpUserViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: SignUpUserViewController.self)) as? SignUpUserViewController
        
        navigationController?.pushViewController(signUp ?? UIViewController(), animated: true)
    }
}
