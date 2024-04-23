//
//  CustomGroupViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 22/04/24.
//

import UIKit

class CustomGroupViewController: UIViewController {

    @IBOutlet weak var newGroupLabel: UILabel!
    @IBOutlet weak var nameGroupTextField: UITextField!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel(label: newGroupLabel)
        configTextField(textField: nameGroupTextField)
        configPhotoButton(button: photoButton)
        configButton(button: createButton)
    }
    
    func configLabel(label: UILabel) {
        label.text = "Novo Grupo"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.tintColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    func configTextField(textField: UITextField) {
        textField.placeholder = "Nome do grupo"
        textField.backgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.14)
        textField.textAlignment = .center
    }
    
    func configPhotoButton(button: UIButton) {
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
    }
    
    func configButton(button: UIButton) {
        button.setTitle("Criar", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.tintColor = UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 1.0)
    }
    
    

}
