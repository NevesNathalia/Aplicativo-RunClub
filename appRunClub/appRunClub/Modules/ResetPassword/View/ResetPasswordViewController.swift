//
//  ResetPasswordViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 31/03/24.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var resetLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var invalidEmailLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private var viewModel = ResetPasswordViewModel()
    private var auth: Auth?
    private var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.auth = Auth.auth()
        alert = Alert(controller: self)
        
    }

    private func setupUI() {
        configLabels(label: resetLabel, text: "Redefinir Senha", font: .systemFont(ofSize: 30, weight: .semibold), aligment: .center)
        resetLabel.tintColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
        configLabels(label: descriptionLabel, text: "Digite o e-mail associado à sua conta e enviaremos um e-mail com instruções para redefinir sua senha.", font: .systemFont(ofSize: 18), aligment: .center)
        descriptionLabel.numberOfLines = 3
        configLabels(label: emailLabel, text: "Email", font: .systemFont(ofSize: 14), aligment: .left)
        configTextField()
        invalidEmailLabel.text = ""
        configButton(button: confirmButton, text: "Confirmar", image: "", color: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), number: 20.0, bool: true)
        configButton(button: backButton, text: "", image: "back.icon2", color: .black, number: 0.0, bool: false)
    }
    
    func configLabels(label: UILabel, text: String, font: UIFont, aligment: NSTextAlignment) {
        label.text = text
        label.font = font
        label.textAlignment = aligment
    }
    
    func configTextField() {
        emailTextField.delegate = self
        emailTextField.layer.cornerRadius = 20.0
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func configButton(button: UIButton, text: String, image: String, color: UIColor, number: Double, bool: Bool) {
        button.setTitle(text, for: .normal)
        button.setImage(UIImage(named: image), for: .normal)
        button.layer.cornerRadius = number
        button.clipsToBounds = bool
        button.tintColor = color
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedShowLogin(_ sender: Any) {
        let validateEmail = viewModel.validadeEmail(emailTextField.text ?? "")
        
        if validateEmail {
            validadeResetPassword()
        } else {
            invalidEmail()
        }
    }
    
    func validadeResetPassword() {
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !email.isEmpty else {
            return
        }
        
        auth?.sendPasswordReset(withEmail: email, completion: { error in
            if let error = error {
                self.alert?.createAlert(title: "Ocorreu um Erro", message: "Não foi possível enviar email de redefinição. Tente novamente!")
            } else {
                self.alert?.createAlert(title: "", message: "Email de redefinição de senha enviado com sucesso!")
                
                let login = UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: LoginViewController.self))
                
                self.navigationController?.pushViewController(login, animated: true)
            }
        })
    }
    
    func invalidEmail() {
        emailTextField.layer.borderWidth = 2.0
        emailTextField.layer.borderColor = UIColor.red.cgColor
        invalidEmailLabel.text = "Validação incorreta"
        invalidEmailLabel.textColor = .red
        invalidEmailLabel.font = .systemFont(ofSize: 12)
    }
}

extension ResetPasswordViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor =  UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0).cgColor
        invalidEmailLabel.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        invalidEmailLabel.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
 
