//
//  CustomGroupViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 22/04/24.
//

import UIKit
import Photos

class CustomGroupViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var newGroupLabel: UILabel!
    @IBOutlet weak var nameGroupTextField: UITextField!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var imageGroup: UIImageView!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar(button: backButton)
        configLabel(label: newGroupLabel)
        configTextField(textField: nameGroupTextField)
        configImageView(image: imageGroup)
        configPhotoButton(button: photoButton)
        configButton(button: createButton)
    }
    
    func configNavigationBar(button: UIButton) {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "back.icon2"), for: .normal)
    }
    
    func configLabel(label: UILabel) {
        label.text = "Novo Grupo"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.textColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    func configTextField(textField: UITextField) {
        textField.placeholder = "Nome do grupo"
        textField.backgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.14)
        textField.textAlignment = .center
    }
    
    func configImageView(image: UIImageView){
        image.isHidden = true
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
    
    @IBAction func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func tappedOpenGalery(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
     
        
    }
    
    @IBAction func tappedCreateGroupButton(_ sender: Any) {
        let communityGroup = UIStoryboard(name: String(describing: CommunityGroupViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: CommunityGroupViewController.self)) as? CommunityGroupViewController
        
        navigationController?.pushViewController(communityGroup ?? UIViewController(), animated: true)
    }
}
extension CustomGroupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
