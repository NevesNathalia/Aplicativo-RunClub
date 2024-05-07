//
//  ResetPasswordViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 31/03/24.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabels(label: resetLabel, text: "Redefinir Senha", font: .systemFont(ofSize: 30, weight: .medium), aligment: .center)
        resetLabel.tintColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
        configLabels(label: descriptionLabel, text: "Digite o e-mail associado à sua conta e enviaremos um e-mail com instruções para redefinir sua senha.", font: .systemFont(ofSize: 18), aligment: .center)
        descriptionLabel.numberOfLines = 3
        configLabels(label: emailLabel, text: "Email", font: .systemFont(ofSize: 14), aligment: .left)
        configTextField()
        invalidEmailLabel.text = ""
        configButton(button: confirmButton, text: "Confirmar", color: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0), number: 20.0, bool: true)
        configButton(button: backButton, text: "Voltar", color: .black, number: 0.0, bool: false)
    }

    func configLabels(label: UILabel, text: String, font: UIFont, aligment: NSTextAlignment) {
        label.text = text
        label.font = font
        label.textAlignment = aligment
    }
    
    func configTextField() {
        emailTextField.layer.cornerRadius = 20.0
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderWidth = 1.0
        emailTextField.placeholder = "Digitar email"
        emailTextField.layer.borderColor = UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0).cgColor
    }
    
    func configButton(button: UIButton, text: String, color: UIColor, number: Double, bool: Bool) {
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = number
        button.clipsToBounds = bool
        button.tintColor = color
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedShowLogin(_ sender: Any) {
        let login = UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: LoginViewController.self))
    
        navigationController?.pushViewController(login, animated: true)
        
    }
    
}
 
