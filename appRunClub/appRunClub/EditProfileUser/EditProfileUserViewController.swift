//
//  EditProfileUserViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 13/04/24.
//

import UIKit

class EditProfileUserViewController: UIViewController {

    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var aboutTextField: UITextField!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var interestTextField: UITextField!
    @IBOutlet weak var lifestyleLabel: UILabel!
    @IBOutlet weak var lifestyleTextField: UITextField!
    @IBOutlet weak var moreLabel: UILabel!
    @IBOutlet weak var moreTextField: UITextField!
    @IBOutlet weak var viewPhotoLabel: UILabel!
    @IBOutlet weak var userImage1: UIImageView!
    @IBOutlet weak var userImage2: UIImageView!
    @IBOutlet weak var userImage3: UIImageView!
    @IBOutlet weak var userImage4: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel(label: aboutLabel, text: "Sobre mim", font: .systemFont(ofSize: 16, weight: .semibold), alignment: .left)
        configLabel(label: interestLabel, text: "Interesses Esportivos", font: .systemFont(ofSize: 16, weight: .semibold), alignment: .left)
        configLabel(label: lifestyleLabel, text: "Estilo de vida", font: .systemFont(ofSize: 16, weight: .semibold), alignment: .left)
        configLabel(label: moreLabel, text: "Extra", font: .systemFont(ofSize: 16, weight: .semibold), alignment: .left)
        configLabel(label: viewPhotoLabel, text: "Fotos de Visualização", font: .systemFont(ofSize: 20, weight: .semibold), alignment: .center)
        configTextField(textField: aboutTextField)
        configTextField(textField: interestTextField)
        configTextField(textField: lifestyleTextField)
        configTextField(textField: moreTextField)
        configButton(button: saveButton)
        configImageView(image: userImage1)
        configImageView(image: userImage2)
        configImageView(image: userImage3)
        configImageView(image: userImage4)
    }
    
    func configLabel(label: UILabel, text: String, font: UIFont, alignment: NSTextAlignment) {
        label.text = text
        label.font = font
        label.textAlignment = alignment
    }
    
    func configTextField(textField: UITextField) {
        textField.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 0.26)
    }
    
    func configButton(button: UIButton) {
        button.setTitle("Salvar", for: .normal)
        button.tintColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    func configImageView(image: UIImageView) {
        image.image = UIImage(named: "profile")
    }
    
    @IBAction func tappedToSaveButton(_ sender: Any) {
        let profile = UIStoryboard(name: String(describing: ProfileUserViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ProfileUserViewController.self)) as? ProfileUserViewController
        
        navigationController?.pushViewController(profile ?? UIViewController(), animated: true)
        
    }
}
