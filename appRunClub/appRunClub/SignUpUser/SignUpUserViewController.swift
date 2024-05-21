//
//  SignUpUserViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 15.05.24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class SignUpUserViewController: UIViewController {

    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var nameUserTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var existingAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    var auth: Auth?
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // configuring Labels
            configLabels(signUpLabel, text: "Cadastre-se", textColor: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), font: .systemFont(ofSize: 30.0, weight: .semibold))
            configLabels(nameUserLabel, text: "Nome Completo", textColor: .black, font: nil)
            configLabels(emailLabel, text: "Email", textColor: .black, font: nil)
            configLabels(passwordLabel, text: "Senha", textColor: .black, font: nil)
        configLabels(confirmPasswordLabel, text: "Confirmar Senha", textColor: .black, font: nil)
            configLabels(existingAccountLabel, text: "Já possui conta?", textColor: .black, font: nil)
            // configuring Text Fields
            configTextFields(nameUserTextField, cornerRadius: 20.0, borderWidth: 1.0, keyboardType: .default, isSecureTextEntry: false)
            configTextFields(emailTextField, cornerRadius: 20.0, borderWidth: 1.0, keyboardType: .emailAddress, isSecureTextEntry: false)
            configTextFields(passwordTextField, cornerRadius: 20.0, borderWidth: 1.0, keyboardType: .default, isSecureTextEntry: true)
        configTextFields(confirmPasswordTextField, cornerRadius: 20.0, borderWidth: 1.0, keyboardType: .default, isSecureTextEntry: true)
            // configuring Buttons
            configButtons(signUpButton, title: "Cadastrar", setTitleColor: .white, backgroundColor: nil, borderColor: CGColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), cornerRadius: 20.0, borderWidth: 1.0, tintColor: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), clipsToBounds: true)
            
            configButtons(loginButton, title: "Log In", setTitleColor: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), backgroundColor: nil, borderColor: nil, cornerRadius: nil, borderWidth: 0.0, tintColor: nil, clipsToBounds: false)
        self.auth = Auth.auth()
        
        }
        
        func configLabels(_ label: UILabel, text: String, textColor: UIColor, font: UIFont?) {
            label.text = text
            label.textColor = textColor
            label.font = font
        }
        
        func configTextFields(_ textField: UITextField, cornerRadius: Double, borderWidth: Double, keyboardType: UIKeyboardType, isSecureTextEntry: Bool) {
            textField.layer.cornerRadius = cornerRadius
            textField.layer.borderWidth = borderWidth
            textField.keyboardType = keyboardType
            textField.isSecureTextEntry = isSecureTextEntry
        }
        
        func configButtons(_ button: UIButton, title: String?, setTitleColor: UIColor?, backgroundColor: UIColor?, borderColor: CGColor?, cornerRadius: Double?, borderWidth: Double?, tintColor: UIColor?, clipsToBounds: Bool?) {
            button.setTitle(title, for: .normal)
            button.setTitleColor(setTitleColor, for: .normal)
            button.backgroundColor = backgroundColor
            button.layer.borderColor = borderColor
            button.layer.cornerRadius = cornerRadius ?? 1.0
            button.layer.borderWidth = borderWidth ?? 1.0
            button.tintColor = tintColor
            button.clipsToBounds = clipsToBounds ?? false
        }
    
    func alert(title: String, messsage: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: messsage, preferredStyle: .alert)
        let ok: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func tappedSignUpButton(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else {
            alert(title: "Erro ao cadastrar", messsage: "O campo de e-mail está vazio.")
               return
           }
           
           guard let password = passwordTextField.text, !password.isEmpty else {
               alert(title: "Erro ao cadastrar", messsage: "O campo de senha está vazio.")
               return
           }
           
           guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
               alert(title: "Erro ao cadastrar", messsage: "O campo de confirmação de senha está vazio.")
               return
           }
           
           guard password == confirmPassword else {
               alert(title: "Erro ao cadastrar", messsage: "As senhas digitadas não coincidem.")
               return
           }
        
        self.auth?.createUser(withEmail: email, password: password, completion: { result, error in
            
            if error != nil {
                self.alert(title: "Erro ao cadastrar", messsage: error?.localizedDescription ?? "")
            } else {
                let tabBar = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController
                
                self.navigationController?.pushViewController(tabBar ?? UIViewController(), animated: true)
            }
        })
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        let login = UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: LoginViewController.self))
    
        navigationController?.pushViewController(login, animated: true)
    }
    
    
    }

    
