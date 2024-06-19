//
//  AddNewUserViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 14/06/24.
//

import UIKit

class AddNewUserViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addUserLabel: UILabel!
    @IBOutlet weak var searchUserTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButton(button: backButton)
        configLabel(label: addUserLabel)
        configTextField(textField: searchUserTextField)
        configTableView(tableView: tableView)
    }
    
    func configButton(button: UIButton) {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "back.icon2"), for: .normal)
    }
    
    func configLabel(label: UILabel) {
        label.text = "Adicionar Atleta"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.textColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    func configTextField(textField: UITextField) {
        textField.backgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.12)
        textField.placeholder = "Pesquisar"
        textField.borderStyle = .none
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 15
    }
     
    func configTableView(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewUserTableViewCell.nib(), forCellReuseIdentifier: NewUserTableViewCell.identifier)
    }
    
    @IBAction func tappedToHomeButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
    
}

extension AddNewUserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewUserTableViewCell.identifier, for: indexPath) as? NewUserTableViewCell
        cell?.setupCell(details: User(image: UIImage(named: "profile") ?? UIImage(), name: "Nome do Usuário", location: "Localização"))
        cell?.layer.borderWidth = 1.0
        cell?.layer.borderColor = UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 1.0).cgColor
        cell?.layer.cornerRadius = 20
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    
}
