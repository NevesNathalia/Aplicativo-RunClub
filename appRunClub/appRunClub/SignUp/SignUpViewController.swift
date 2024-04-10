//
//  SignUpViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 02.04.24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var labelSignUp: UILabel!
    
    @IBOutlet weak var labelNomeCompleto: UILabel!
    
    @IBOutlet weak var textFieldNomeCompleto: UITextField!
    
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var labelSenha: UILabel!
    
    @IBOutlet weak var textFieldSenha: UITextField!
    
    @IBOutlet weak var buttonSignUp: UIButton!
    
    @IBOutlet weak var labelJaPossuiConta: UILabel!
    
    @IBOutlet weak var buttonToLogIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // configuring Labels
        configLabels(labelSignUp, text: "Sign Up", textColor: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), font: .systemFont(ofSize: 30.0, weight: .semibold))
        configLabels(labelNomeCompleto, text: "Nome Completo", textColor: .black, font: nil)
        configLabels(labelEmail, text: "Email", textColor: .black, font: nil)
        configLabels(labelSenha, text: "Senha", textColor: .black, font: nil)
        configLabels(labelJaPossuiConta, text: "Já possui conta?", textColor: .black, font: nil)
        // configuring Text Fields
        configTextFields(textFieldNomeCompleto, cornerRadius: 20.0, borderWidth: 1.0, keyboardType: .default, isSecureTextEntry: false)
        configTextFields(textFieldEmail, cornerRadius: 20.0, borderWidth: 1.0, keyboardType: .emailAddress, isSecureTextEntry: false)
        configTextFields(textFieldSenha, cornerRadius: 20.0, borderWidth: 1.0, keyboardType: .default, isSecureTextEntry: true)
        // configuring Buttons
        configButtons(buttonSignUp, title: "Sign Up", setTitleColor: .white, backgroundColor: nil, borderColor: CGColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), cornerRadius: 20.0, borderWidth: 1.0, tintColor: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), clipsToBounds: true)
        
        configButtons(buttonToLogIn, title: "Log In", setTitleColor: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), backgroundColor: nil, borderColor: nil, cornerRadius: nil, borderWidth: 0.0, tintColor: nil, clipsToBounds: false)
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
    
    @IBAction func tappedButtonSignUp(_ sender: UIButton) {
    }
    
    @IBAction func tappedButtonToLogIn(_ sender: UIButton) {
    }
    

}
