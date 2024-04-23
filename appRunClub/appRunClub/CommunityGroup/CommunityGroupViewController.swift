//
//  CommunityGroupViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 22/04/24.
//

import UIKit

class CommunityGroupViewController: UIViewController {

    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var mensageTextField: UITextField!
    @IBOutlet weak var toSendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    func configView(view: UIView, color: UIColor) {
        view.backgroundColor = color
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
    


}
