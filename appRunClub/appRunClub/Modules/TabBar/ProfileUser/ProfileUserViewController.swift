//
//  ProfileUserViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 12/04/24.
//

import UIKit

class ProfileUserViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var editPhotoButton: UIButton!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var editDataButton: UIButton!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var aboutTextField: UITextField!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var interestTextField: UITextField!
    @IBOutlet weak var lifestyleLabel: UILabel!
    @IBOutlet weak var lifestyleTextField: UITextField!
    @IBOutlet weak var moreLabel: UILabel!
    @IBOutlet weak var moreTextField: UITextField!
    @IBOutlet weak var viewPhotoButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel(label: nameUserLabel, text: "Nome do Usuário", font: .systemFont(ofSize: 20, weight: .medium), alignment: .center)
        configLabel(label: aboutLabel, text: "Sobre mim", font: .systemFont(ofSize: 14, weight: .semibold), alignment: .left)
        configLabel(label: interestLabel, text: "Interesses Esportivos", font: .systemFont(ofSize: 14, weight: .semibold), alignment: .left)
        configLabel(label: lifestyleLabel, text: "Estilo de vida", font: .systemFont(ofSize: 14, weight: .semibold), alignment: .left)
        configLabel(label: moreLabel, text: "Extra", font: .systemFont(ofSize: 14, weight: .semibold), alignment: .left)
        configButton(button: editPhotoButton, text: "", color: .systemGray5, float: 0.0, bool: false)
        configButton(button: editDataButton, text: "", color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), float: 0.0, bool: false)
        configButton(button: viewPhotoButton, text: "Visualizar fotos", color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), float: 20.0, bool: true)
        configImageButton(button: editPhotoButton, image: "camera", color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0))
        configImageButton(button: editDataButton, image: "pencil", color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0))
        configTextField(textField: aboutTextField)
        configTextField(textField: interestTextField)
        configTextField(textField: lifestyleTextField)
        configTextField(textField: moreTextField)
        configImageView(userImage: userImageView, image: "person.circle.fill", color: .systemGray3)

    }

    func configImageView(userImage: UIImageView, image: String, color: UIColor) {
        userImage.image = UIImage(systemName: image)
        userImage.tintColor = color
    }
    
    func configLabel(label: UILabel, text: String, font: UIFont, alignment: NSTextAlignment) {
        label.text = text
        label.font = font
        label.textAlignment = alignment
    }
    func configButton(button: UIButton, text: String, color: UIColor, float: CGFloat, bool: Bool) {
        button.setTitle(text, for: .normal)
        button.tintColor = color
        button.layer.cornerRadius = float
        button.clipsToBounds = bool
    }
    
    func configImageButton(button: UIButton, image: String, color: UIColor) {
        button.setImage(UIImage(systemName: image), for: .normal)
        button.tintColor = color
    }
    
    func configTextField(textField: UITextField) {
        textField.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 0.26)
    }
    
    @IBAction func tappedEditDataButton(_ sender: Any) {
        let editProfile = UIStoryboard(name: String(describing: EditProfileUserViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: EditProfileUserViewController.self))
        
        navigationController?.pushViewController(editProfile, animated: true)
    }
    
    
    @IBAction func tappedViewPhotoButton(_ sender: Any) {
        let viewPhoto = UIStoryboard(name: String(describing: ViewPhotosViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ViewPhotosViewController.self))
        
        viewPhoto.modalPresentationStyle = .fullScreen
        present(viewPhoto, animated: true)
    }
}
