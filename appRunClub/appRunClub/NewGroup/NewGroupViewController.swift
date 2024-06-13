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
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    let contactList: [Contacts] = [Contacts(image:  UIImage(named: "profile") ?? UIImage(), name: "Contato", isEnableButton: true),
                                   Contacts(image:  UIImage(named: "profile") ?? UIImage(), name: "Contato", isEnableButton: true),
                                   Contacts(image:  UIImage(named: "profile") ?? UIImage(), name: "Contato", isEnableButton: true),
                                   Contacts(image:  UIImage(named: "profile") ?? UIImage(), name: "Contato", isEnableButton: true)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configLabel(label: addMembersLabel)
        configNavigationBar(button: backButton, text: "", image: "back.icon2")
        configNavigationBar(button: advanceButton, text: "", image: "advance.icon")
    }
    
    func configLabel(label: UILabel) {
        label.text = "Adicionar Atleta"
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.textColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    func configNavigationBar(button: UIButton, text: String, image: String) {
        button.setTitle(text, for: .normal)
        button.setImage(UIImage(named: image), for: .normal)
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
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.identifier, for: indexPath) as? ContactsTableViewCell
        cell?.setupCell(details: contactList[indexPath.row])
        cell?.delegate(delegate: self)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
}

extension NewGroupViewController: ContactsTableViewCellDelegate {
    func selectContact(in cell: ContactsTableViewCell, button: UIButton) {
        button.isSelected.toggle()
        
        if  button.isEnabled {
            button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
            button.tintColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
        } else {
            button.setImage(UIImage(systemName: "square"), for: .normal)
            button.tintColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
        }
    }
}
