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
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logInLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var invalidLabel: UILabel!
    @IBOutlet weak var passwordForgotButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var toSignUpButton: UIButton!
    @IBOutlet weak var loginGoogleButton: UIButton!
    @IBOutlet weak var googleImage: UIImageView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private let viewModel: LoginViewModel = LoginViewModel()
    private var alert: Alert?
    private var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupCofigElements()
        alert = Alert(controller: self)
        self.auth = Auth.auth()
    }
    
    private func setupCofigElements() {
        configLabel(label: logInLabel, text: "Login", color: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), font:  UIFont.systemFont(ofSize: 30.0, weight: .semibold))
        configLabel(label: emailLabel, text: "Email", color: .black, font: nil)
        configLabel(label: passwordLabel, text: "Senha", color: .black, font: nil)
        invalidLabel.text = ""
        configTextFields()
        configButtons()
        configImageButton(image: googleImage)
    }
    
    private func configLabel( label: UILabel, text: String, color: UIColor?, font: UIFont?) {
        label.text = text
        label.textColor = color
        label.font = font
    }
    
    private func configTextFields() {
        configProtocol()
        emailTextField.clipsToBounds = true
        emailTextField.layer.cornerRadius = 20.0
        emailTextField.layer.borderWidth = 1.0
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.cornerRadius = 20.0
        passwordTextField.layer.borderWidth = 1.0
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        
    }
    
    private func configProtocol() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func configButtons() {
        passwordForgotButton.setTitle("Esqueci minha senha", for: .normal)
        submitButton.setTitle("Entrar", for: .normal)
        toSignUpButton.setTitle("Não tenho uma conta", for: .normal)
        loginGoogleButton.setTitle("Entrar com Google", for: .normal)
        passwordForgotButton.setTitleColor(UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), for: .normal)
        submitButton.backgroundColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
        toSignUpButton.setTitleColor(UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), for: .normal)
        loginGoogleButton.setTitleColor(.black, for: .normal)
        submitButton.clipsToBounds = true
        submitButton.layer.cornerRadius = 20.0
        loginGoogleButton.clipsToBounds = true
        loginGoogleButton.layer.cornerRadius = 20.0
        submitButton.tintColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
        loginGoogleButton.layer.borderWidth = 1.0
        loginGoogleButton.layer.borderColor = UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.70).cgColor
        loginGoogleButton.tintColor = .white
    }
    
    private func configImageButton(image: UIImageView) {
        image.image = UIImage(named: "logo.google")
        
    }

    @IBAction func tappedForgotPasswordButton(_ sender: UIButton) {
        let resetPasword = UIStoryboard(name: String(describing: ResetPasswordViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ResetPasswordViewController.self)) as? ResetPasswordViewController
        
        navigationController?.pushViewController(resetPasword ?? UIViewController(), animated: true)
        
    }
    
    @IBAction func tappedSubmitButton(_ sender: UIButton) {
        
        let validateEmail = viewModel.validadeEmail(emailTextField.text ?? "")
        let validadePassword = viewModel.validadePassword(passwordTextField.text ?? "")
        
        if validateEmail && validadePassword {
            validateLogin()
        } else {
            invalidTextField()
        }
        
    }
    
    private func validateLogin() {
        self.auth?.signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "", completion: { usuario, error in
            
            if error != nil {
                self.alert?.createAlert(title: "Erro ao Logar", message: "Verifique se os dados estão corretos e se correspondem a um usuário validado.")
            } else {
                if usuario == nil {
                    self.alert?.createAlert(title: "Usuário inválido", message: "Os dados informados não correspondem a um usuário válido.")
                } else {
                    let tabBar = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self)) as? TabBarController
                    self.clearTextField()
                    
                    self.navigationController?.pushViewController(tabBar ?? UIViewController(), animated: true)
                }
            }
        })
        
    }
    
    private func invalidTextField() {
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.red.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.red.cgColor
        invalidLabel.text = "Validação incorreta"
        invalidLabel.textColor = .red
        invalidLabel.font = .systemFont(ofSize: 12)
    }
    
    private func clearTextField() {
        emailTextField.text = ""
        passwordTextField.text = ""
        invalidLabel.text = ""
    }

    @IBAction func tappedToSignUpButton(_ sender: UIButton) {
        
        let signUp = UIStoryboard(name: String(describing: SignUpUserViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: SignUpUserViewController.self)) as? SignUpUserViewController
        
        navigationController?.pushViewController(signUp ?? UIViewController(), animated: true)
    }
    
    @IBAction func tappedLoginGoogleButton(_ sender: Any) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
           return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
           return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                
                if error != nil {
                    self.alert?.createAlert(title: "Falha ao Logar", message: "Tente novamente mais tarde.")
                } else {
                    let tabBar = UIStoryboard(name: String(describing: TabBarController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: TabBarController.self))
                    
                    self.navigationController?.pushViewController(tabBar, animated: true)
                }
            }

        }
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.layer.borderWidth = 2.0
            emailTextField.layer.borderColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0).cgColor
            invalidLabel.text = ""
        } else {
            passwordTextField.layer.borderWidth = 2.0
            passwordTextField.layer.borderColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0).cgColor
            invalidLabel.text = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        invalidLabel.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.getTextFieldShouldReturn(textField: textField, emailTextField: emailTextField, passwordTextField: passwordTextField)
    }
    
}
