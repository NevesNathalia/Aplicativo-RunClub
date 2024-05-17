//
//  SearchUserViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 17.05.24.
//

import UIKit

class SearchUserViewController: UIViewController {
    
    @IBOutlet weak var searchUserLabel: UILabel!
    
    @IBOutlet weak var searchUserTextField: UITextField!
    
    @IBOutlet weak var searchUserButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel()
        configTextField()
    }
    
    func configTextField() {
        searchUserTextField.layer.cornerRadius = 10.0
        searchUserTextField.clipsToBounds = true
        searchUserTextField.placeholder = "Pesquisar"
        searchUserTextField.backgroundColor = .systemGray5
    }
    
    func configLabel() {
        searchUserLabel.text = "Buscar Usuários"
        searchUserLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        searchUserLabel.textColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    @IBAction func tappedButton(_ sender: UIButton) {
        let paraOutraTela = UIStoryboard(name: String(describing: InfoOtherUserViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: InfoOtherUserViewController.self))
        
        navigationController?.pushViewController(paraOutraTela, animated: true)
    }
        
        
    }

        

