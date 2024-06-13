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
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }

    private func setupUI() {
        configLabels(label: welcomeLabel, text: "Bem Vindo ao", font: .systemFont(ofSize: 30, weight: .semibold), aligment: .center)
        configLabels(label: nameLabel, text: "RunClub!", font: .systemFont(ofSize: 30, weight: .semibold), aligment: .center)
        configButtons(button: loginButton)
        loginButton.setTitle("Começar", for: .normal)
    }
    
    
    private func configLabels(label: UILabel, text: String, font: UIFont, aligment: NSTextAlignment) {
        label.text = text
        label.font = font
        label.textAlignment = aligment
    }
    
    private func configButtons(button: UIButton) {
        button.layer.cornerRadius = 20.0
        button.clipsToBounds = true
        button.tintColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
    }

   
    
    private func markAcessViewed() {
        UserDefaults.standard.set(true, forKey: "AcessViewed")
    }
    
    @IBAction func tappedLoginButton(_ sender: Any) {
        markAcessViewed()
        navigateToTransferViewController()
    }
    
    private func navigateToTransferViewController() {
        let viewController = UIStoryboard(name: String(describing: LoginViewController.self), bundle: nil).instantiateViewController(identifier: String(describing: LoginViewController.self))
    
        navigationController?.pushViewController(viewController, animated: true)
    }
}

