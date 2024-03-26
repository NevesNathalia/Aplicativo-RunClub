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
        configLabels()
        configButtons()
    }

    func configLabels() {
        welcomeLabel.text = "Bem vindo ao"
        nameLabel.text = "RunClub!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        nameLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        welcomeLabel.textAlignment = .center
        nameLabel.textAlignment = .center
        
    }
    
    func configButtons() {
        registerButton.setTitle("Cadastro", for: .normal)
        registerButton.layer.cornerRadius = 20.0
        registerButton.clipsToBounds = true
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 20.0
        loginButton.clipsToBounds = true
    }

    @IBAction func tappedRegisterButton(_ sender: Any) {
    }
    
}

