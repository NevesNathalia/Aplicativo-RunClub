//
//  CommunityGroupViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 22/04/24.
//

import UIKit

class CommunityGroupViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var mensageTextField: UITextField!
    @IBOutlet weak var toSendButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView(view: viewTop, color: UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 0.76))
        configNavigationBar(button: backButton)
        configImageView(image: personImage)
        configLabel(label: nameLabel)
        configView(view: viewBottom, color: UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 0.76))
        configTextField(textField: mensageTextField)
        configButton(button: toSendButton)
    }
    
    func configView(view: UIView, color: UIColor) {
        view.backgroundColor = color
    }
    
    func configNavigationBar(button: UIButton) {
        button.setTitle("Voltar", for: .normal)
        button.tintColor = .black
    }
    
    func configImageView(image: UIImageView) {
        image.image = UIImage(named: "profile")
    }
    
    func configLabel(label: UILabel) {
        label.text = "Contato"
        label.font = .systemFont(ofSize: 16)
    }
    
    func configTextField(textField: UITextField) {
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Digitar"
        textField.layer.cornerRadius = 20
        textField.clipsToBounds = true
    }
    
    func configButton(button: UIButton) {
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 0.76)
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        let chat = UIStoryboard(name: String(describing: ChatViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ChatViewController.self))
        
        navigationController?.pushViewController(chat, animated: true)
    }
    
    @IBAction func tappedReturnMessageButton(_ sender: Any) {
//        let chat = UIStoryboard(name: String(describing: ChatViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ChatViewController.self))
//        
//        navigationController?.pushViewController(chat, animated: true)
        
    }
}
