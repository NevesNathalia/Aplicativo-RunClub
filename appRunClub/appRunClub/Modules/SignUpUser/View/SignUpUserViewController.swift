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
    @IBOutlet weak var loginButton: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private let viewModel = SignUpUserViewModel()
    private var auth: Auth?
    private var alert: Alert?
    
    override func viewDidLoad() {
            super.viewDidLoad()
        setupConfigElemnts()
        self.auth = Auth.auth()
        alert = Alert(controller: self)

        }
    
    private func setupConfigElemnts() {
        configLabels(signUpLabel, text: "Cadastro", textColor: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), font: .systemFont(ofSize: 30.0, weight: .semibold))
        configLabels(nameUserLabel, text: "Nome Completo", textColor: .black, font: nil)
        configLabels(emailLabel, text: "Email", textColor: .black, font: nil)
        configLabels(passwordLabel, text: "Senha", textColor: .black, font: nil)
        configLabels(confirmPasswordLabel, text: "Confirmar Senha", textColor: .black, font: nil)
        configTextFields(nameUserTextField, keyboardType: .default, isSecureTextEntry: false)
        configTextFields(emailTextField, keyboardType: .emailAddress, isSecureTextEntry: false)
        configTextFields(passwordTextField, keyboardType: .default, isSecureTextEntry: true)
        configTextFields(confirmPasswordTextField, keyboardType: .default, isSecureTextEntry: true)
        configButtons(button: signUpButton, title: "Cadastrar")
        configButtons(button: loginButton, title: "Já tenho uma conta")
    }
    
    private func configLabels(_ label: UILabel, text: String, textColor: UIColor, font: UIFont?) {
        label.text = text
        label.textColor = textColor
        label.font = font
        }
        
    private func configTextFields(_ textField: UITextField, keyboardType: UIKeyboardType, isSecureTextEntry: Bool) {
        configProtocol()
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 20
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecureTextEntry
        nameUserTextField.autocapitalizationType = .words
        }
        
    private func configProtocol() {
        nameUserTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    private func configButtons(button : UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.tintColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
        signUpButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 20
        }
    
    func registerNewUser() {
        guard let emailValid = emailTextField.text, let passwordValid = passwordTextField.text else {return}
        self.auth?.createUser(withEmail: emailValid, password: passwordValid,  completion: { result, error in
            
            if error != nil {
                self.alert?.createAlert(title: "Erro ao cadastrar", message: "o email informado já está associado a uma conta existente.")
            } else {
                    let tabBar = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController
                    
                    self.navigationController?.pushViewController(tabBar ?? UIViewController(), animated: true)
            }
        })
        
    }
    
    @IBAction func tappedSignUpButton(_ sender: Any) {
//        guard let emailValid = emailTextField.text, let passwordValid = passwordTextField.text else {return}

//        guard let email = emailTextField.text, !email.isEmpty else {
//            alert(title: "Erro ao cadastrar", messsage: "O campo de e-mail está vazio.")
//               return
//           }
//           
//           guard let password = passwordTextField.text, !password.isEmpty else {
//               alert(title: "Erro ao cadastrar", messsage: "O campo de senha está vazio.")
//               return
//           }
//           
//           guard let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
//               alert(title: "Erro ao cadastrar", messsage: "O campo de confirmação de senha está vazio.")
//               return
//           }
//           
//           guard password == confirmPassword else {
//               alert(title: "Erro ao cadastrar", messsage: "As senhas digitadas não coincidem.")
//               return
//           }
//        
//        self.auth?.createUser(withEmail: emailValid, password: passwordValid, completion: { result, error in
//            
//            if error != nil {
//                self.alert?.createAlert(title: "Erro ao cadastrar", message: "o email informado já está associado a uma conta existente.")
//            } else {
//                let tabBar = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController
//                
//                self.navigationController?.pushViewController(tabBar ?? UIViewController(), animated: true)
//            }
//        })
        
        guard let nameValue = nameUserTextField.text,
                let emailValue = emailTextField.text,
                let passwordValue = passwordTextField.text,
                let confirmPasswordValue = confirmPasswordTextField.text
        else {return}
        
        if viewModel.validateData(name: nameValue, email: emailValue, password: passwordValue, confirmPassword: confirmPasswordValue) {
            registerNewUser()
        } else {
            self.alert?.createAlert(title: "Erro Cadastrar", message: "Certifique-se de que os dados são válidos.")
        }
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        let login = UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: LoginViewController.self))
    
        navigationController?.pushViewController(login, animated: true)
    }
    
    }

extension SignUpUserViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        switch textField {
        case nameUserTextField:
            nameUserTextField.layer.borderWidth = 2.0
            nameUserTextField.layer.borderColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0).cgColor
        case emailTextField:
            emailTextField.layer.borderWidth = 2.0
            emailTextField.layer.borderColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0).cgColor
        case passwordTextField:
            passwordTextField.layer.borderWidth = 2.0
            passwordTextField.layer.borderColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0).cgColor
        case confirmPasswordTextField:
            confirmPasswordTextField.layer.borderWidth = 2.0
            confirmPasswordTextField.layer.borderColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0).cgColor
        default:
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let nameValue = nameUserTextField.text,
                let emailValue = emailTextField.text,
                let passwordValue = passwordTextField.text,
                let confirmPasswordValue = confirmPasswordTextField.text
        else {return}
        
        switch textField {
        case nameUserTextField:
            if viewModel.validateName(nameValue) {
                nameUserTextField.layer.borderWidth = 2.0
                nameUserTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                nameUserTextField.layer.borderWidth = 1.0
                nameUserTextField.layer.borderColor = UIColor.black.cgColor
            }
            
        case emailTextField:
            if viewModel.validateEmail(emailValue) {
                emailTextField.layer.borderWidth = 2.0
                emailTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                emailTextField.layer.borderWidth = 1.0
                emailTextField.layer.borderColor = UIColor.black.cgColor
            }
            
        case passwordTextField:
            if viewModel.validadePassword(passwordValue) {
                passwordTextField.layer.borderWidth = 2.0
                passwordTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                passwordTextField.layer.borderWidth = 1.0
                passwordTextField.layer.borderColor = UIColor.black.cgColor
            }
            if viewModel.validateConfirmPassword(confirmPasswordValue) {
                confirmPasswordTextField.layer.borderWidth = 2.0
                confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                confirmPasswordTextField.layer.borderWidth = 1.0
                confirmPasswordTextField.layer.borderColor = UIColor.black.cgColor
            }
            
        default:
            if viewModel.validateConfirmPassword(confirmPasswordValue) {
                confirmPasswordTextField.layer.borderWidth = 2.0
                confirmPasswordTextField.layer.borderColor = UIColor.red.cgColor
            } else {
                confirmPasswordTextField.layer.borderWidth = 1.0
                confirmPasswordTextField.layer.borderColor = UIColor.black.cgColor
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.getConfigTextFieldShouldReturn(textField: textField, nameTextField: nameUserTextField, emailTextField: emailTextField, passwordTextField: passwordTextField, confirmPasswordTextField: confirmPasswordTextField)
    }
}
