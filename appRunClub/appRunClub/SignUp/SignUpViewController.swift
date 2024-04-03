//
//  SignUpViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 02.04.24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var labelSignUp: UILabel!
    
    @IBOutlet weak var labelNomeCompleto: UILabel!
    
    @IBOutlet weak var textFieldNomeCompleto: UITextField!
    
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var labelSenha: UILabel!
    
    @IBOutlet weak var textFieldSenha: UITextField!
    
    @IBOutlet weak var buttonSignUp: UIButton!
    
    @IBOutlet weak var labelJaPossuiConta: UILabel!
    
    @IBOutlet weak var buttonToLogIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // configurating Labels
        configLabels(labelSignUp, text: "Sign Up", textColor: UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0))
        configLabels(labelNomeCompleto, text: "Nome Completo", textColor: .black)
        configLabels(labelEmail, text: "Email", textColor: .black)
        configLabels(labelSenha, text: "Senha", textColor: .black)
        configLabels(labelJaPossuiConta, text: "Já possui conta?", textColor: .black)
        
    }
    
    func configLabels(_ label: UILabel, text: String, textColor: UIColor) {
        label.text = text
        label.textColor = textColor
    }
    
    func configTextFields() {
        
    }
    
    func configButtons() {
        
    }
    
    @IBAction func tappedButtonSignUp(_ sender: UIButton) {
    }
    
    @IBAction func tappedButtonToLogIn(_ sender: UIButton) {
    }
    

}
