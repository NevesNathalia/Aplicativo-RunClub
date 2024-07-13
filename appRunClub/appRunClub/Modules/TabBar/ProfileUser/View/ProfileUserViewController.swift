//
//  ProfileUserViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 12/04/24.
//

import UIKit
import Photos
import FirebaseAuth

struct UserDefaultsKey {
    static func textFieldKey(forUID uid: String) -> String {
        return "\(uid)_textFieldKey"
    }
}

class ProfileUserViewController: UIViewController {
    
    @IBOutlet weak var viewUser: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var editPhotoButton: UIButton!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var goalsTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var exitAccountButton: UIButton!
    
    var uid: String?
    private var alert: Alert?
    var characterLimitPerLine = 20
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uidUser()
        alert = Alert(controller: self)
        setupConfigElements()
    }
    
    private func setupConfigElements() {
        configView(view: viewUser, color: .clear)
        configLabel(label: nameUserLabel, text: "Nome do Usuário", font: .systemFont(ofSize: 20, weight: .medium), alignment: .center, color: UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0))
        configLabel(label: goalsLabel, text: "Metas e Desejos", font: .systemFont(ofSize: 17, weight: .semibold), alignment: .center, color:UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0))
        configTextFields(textField: goalsTextField)
        configButton(button: editPhotoButton, text: "", color: .systemGray5, float: 0.0, bool: false)
        configButton(button: saveButton, text: "Salvar", color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), float: 20.0, bool: true)
        configButton(button: exitAccountButton, text: "Sair", color: .red, float: 0.0, bool: false)
        configImageButton(button: editPhotoButton, image: "camera", color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0))
        configImageView(userImage: userImageView, image: "profile", color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0))
    }
    
    func uidUser() {
        // Obtém o usuário atual do Firebase Authentication
        guard let currentUser = Auth.auth().currentUser else { return }
        
        // Define o UID do usuário
        uid  = currentUser.uid
        
        // Verifica se o UID foi obtido corretamente
        guard uid != nil else { return }
    }
    
    private func configView(view: UIView, color: UIColor) {
        view.backgroundColor = color
    }
    
    private func configImageView(userImage: UIImageView, image: String, color: UIColor) {
        userImage.image = UIImage(named: image)
        userImage.layer.borderWidth = 3.0
        userImage.layer.borderColor = color.cgColor
        userImage.clipsToBounds = true
        userImage.layer.cornerRadius = 60
    }
    
    private func configLabel(label: UILabel, text: String, font: UIFont, alignment: NSTextAlignment, color: UIColor) {
        label.text = text
        label.font = font
        label.textAlignment = alignment
        label.textColor = color
    }
    
    private func configTextFields(textField: UITextField) {
        textField.delegate = self
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.text = UserDefaults.standard.string(forKey: UserDefaultsKey.textFieldKey(forUID: uid ?? ""))
        textField.placeholder = "Exemplos:Praticar atividade física, alimentação equilibrada, etc"
    }
    
    private func configButton(button: UIButton, text: String, color: UIColor, float: CGFloat, bool: Bool) {
        saveButton.isEnabled = false
        button.setTitle(text, for: .normal)
        button.tintColor = color
        button.clipsToBounds = bool
        button.layer.cornerRadius = float
    }
    
    private func configImageButton(button: UIButton, image: String, color: UIColor) {
        button.setImage(UIImage(systemName: image), for: .normal)
        button.tintColor = color
    }
    
   
    
    @IBAction func tappedOpenGallery(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        present(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func tappedSaveDataButton(_ sender: Any) {
        guard let uid = uid else { return }
        
        UserDefaults.standard.set(goalsTextField.text, forKey: UserDefaultsKey.textFieldKey(forUID: uid))
        
        self.alert?.createAlert(title: "", message: "Alteração salva com sucesso!") {
            self.saveButton.isEnabled = false
        }
    }
    
    @IBAction func tappedExitAccountButton(_ sender: Any) {
        self.alert?.exitAcount(title: "Atenção", message: "Ao sair da conta logada poderá ocorrer a perda de dados. Deseja continuar?", completion: { _ in
            self.signOut()
        })
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
            if let welcome = storyboard?.instantiateViewController(identifier: "Main") as? ViewController {
                welcome.modalPresentationStyle = .fullScreen
                present(welcome, animated: true, completion: nil)
            }
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            self.alert?.createAlert(title: "Erro", message: "Não foi possível sair da conta. Tente novamente.")
        }
    }
    
    }
    
    extension ProfileUserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                userImageView.image = image
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    extension ProfileUserViewController: UITextFieldDelegate {
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard let uid = uid else {
                return true
            }
            
            let currentText = textField.text ?? ""
            let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            if textField == goalsTextField {
                UserDefaults.standard.set(updatedText, forKey: UserDefaultsKey.textFieldKey(forUID: uid))
                self.saveButton.isEnabled = true
            }
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            if textField == goalsTextField {
                goalsTextField.isEnabled = true
                goalsTextField.layer.borderWidth = 2.0
                goalsTextField.layer.borderColor = UIColor(red: 82/255, green: 183/255, blue: 156/255, alpha: 1.0).cgColor
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            if textField == goalsTextField {
                goalsTextField.isEnabled = false
                goalsTextField.layer.borderWidth = 1.0
                goalsTextField.layer.borderColor = UIColor.systemGray.cgColor
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            //        textField.isEnabled = true
            return true
        }
    }

