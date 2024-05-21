//
//  ChatViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 17/04/24.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var groupButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configLabel(label: chatLabel)
        configButton(button: groupButton, text: "+ Group", color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), number: 20.0, bool: true)
        view.backgroundColor = UIColor(red: 226/255, green: 247/255, blue: 239/255, alpha: 1.0)
    }
    
    func configLabel(label: UILabel) {
        label.text = "Chat"
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.textColor = UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0)
    }
    
    func configButton(button: UIButton, text: String, color: UIColor, number: Double, bool: Bool) {
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = number
        button.clipsToBounds = bool
        button.tintColor = color
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
    }
    
    @IBAction func tappedListContactsButton(_ sender: Any) {
        let newGroup = UIStoryboard(name: String(describing: NewGroupViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: NewGroupViewController.self)) as? NewGroupViewController
        
        navigationController?.pushViewController(newGroup ?? UIViewController(), animated: true)
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
        cell?.setupCell(data: User(image: UIImage(named: "profile") ?? UIImage(), name: "Contato", mensage: "Mensagem", location: "", description: ""))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
