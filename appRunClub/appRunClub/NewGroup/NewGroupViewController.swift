//
//  NewGroupViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 18/04/24.
//

import UIKit

class NewGroupViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addMembersLabel: UILabel!
    @IBOutlet weak var advanceButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configLabel(label: addMembersLabel)
        configTextField(textField: searchTextField)
        configNavigationBar(button: backButton, text: "Voltar", color: .black)
        configNavigationBar(button: advanceButton, text: "Avançar", color: .black)
    }
    
    func configLabel(label: UILabel) {
        label.text = "Adicionar Membros"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.textColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    func configNavigationBar(button: UIButton, text: String, color: UIColor) {
        button.setTitle(text, for: .normal)
        button.tintColor = color
    }
    
    func configTextField(textField: UITextField) {
        textField.placeholder = "Pesquisar"
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.backgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.14)
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ContactsTableViewCell.nib(), forCellReuseIdentifier: ContactsTableViewCell.identifier)
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tappedAdvanceButton(_ sender: Any) {
        let customGroup = UIStoryboard(name: String(describing: CustomGroupViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: CustomGroupViewController.self)) as? CustomGroupViewController

        navigationController?.pushViewController(customGroup ?? UIViewController(), animated: true)
        
    }
}

extension NewGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.identifier, for: indexPath) as? ContactsTableViewCell
        cell?.setupCell(details: Contacts(image: UIImage(systemName: "person.circle.fill") ?? UIImage(), name: "Contato", isEnabled: true))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
}
