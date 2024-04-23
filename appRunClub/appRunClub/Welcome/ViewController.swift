//
//  ViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 19/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabels(label: welcomeLabel, text: "Bem Vindo ao", font: .systemFont(ofSize: 30, weight: .semibold), aligment: .center)
        configLabels(label: nameLabel, text: "RunClub!", font: .systemFont(ofSize: 30, weight: .semibold), aligment: .center)
        configButtons(button: registerButton)
        configButtons(button: loginButton)
        registerButton.setTitle("Cadastro", for: .normal)
        loginButton.setTitle("Login", for: .normal)
    }

    func configLabels(label: UILabel, text: String, font: UIFont, aligment: NSTextAlignment) {
        label.text = text
        label.font = font
        label.textAlignment = aligment
    }
    
    
    func configButtons(button: UIButton) {
        button.layer.cornerRadius = 20.0
        button.clipsToBounds = true
        button.tintColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
    }

    
    @IBAction func tappedRegisterButton(_ sender: Any) {
//        let paraSignUp = UIStoryboard(name: String(describing: SignUpViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: SignUpViewController.self))
//        
//        navigationController?.pushViewController(paraSignUp, animated: true)
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        let login = UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: LoginViewController.self))
    
        navigationController?.pushViewController(login, animated: true)
    }
}

