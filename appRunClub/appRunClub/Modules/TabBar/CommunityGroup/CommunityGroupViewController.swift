//
//  CommunityGroupViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 22/04/24.
//

import UIKit

class CommunityGroupViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    var messageList: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0)
        configView(view: viewBottom, color: UIColor(red: 162/255, green: 213/255, blue: 198/255, alpha: 0.56))
       configBarView(view: barView)
        configNavigationBar(button: backButton)
        configImageView(image: personImage)
        configLabel(label: nameLabel)
        configTextField(textField: messageTextField)
        configButton(button: sendButton)
        configTableView()
        
    }
    func configNavigationBar(button: UIButton) {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "back.icon"), for: .normal)
    }
    
    func configView(view: UIView, color: UIColor) {
        view.backgroundColor = color
    }
    
    func configImageView(image: UIImageView) {
        image.image = UIImage(named: "profile")
        image.layer.cornerRadius = 20
    }
    
    func configTableView() {
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OutgoingTextMessageTableViewCell.self, forCellReuseIdentifier: OutgoingTextMessageTableViewCell.identifier)
        tableView.register(IncomingTextMessageTableViewCell.self, forCellReuseIdentifier: IncomingTextMessageTableViewCell.identifier)
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        tableView.separatorStyle = .none
    }
    
    func configBarView(view: UIView) {
        view.backgroundColor = UIColor(red: 239/255, green: 242/255, blue: 243/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
    }
    
    func configLabel(label: UILabel) {
        label.text = "Contato"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    func configTextField(textField: UITextField) {
        textField.backgroundColor = .clear
        textField.placeholder = "Digitar"
        textField.borderStyle = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .asciiCapable
        textField.delegate = self
    }
    
    func configButton(button: UIButton) {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 0.76)
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.5
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowOpacity = 0.3
        button.isEnabled = false
    }
    
    func addMessage(message: String, type: TypeMessage) {
        messageList.insert(Message(message: message.trimmingCharacters(in: .whitespacesAndNewlines), typeMessage: type), at: .zero)
    }
    func loadCurrentMessage(indexPath: IndexPath) -> Message {
        return messageList[indexPath.row]
    }
    
    func heightForRow(indexPath: IndexPath) -> CGFloat {
        let message = loadCurrentMessage(indexPath: indexPath).message
        let font = UIFont.helveticaNeueMedium(size: 16)
        let estimetedHeight = message.heightWithConstrainedWidth(width: 220, font: font)
        return estimetedHeight + 65
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func sendMessage(text: String) {
        addMessage(message: text, type: .user)
        reloadTableView()
    }
    
    func pushMessage() {
        messageTextField.text = ""
        sendButton.isEnabled = false
        sendButton.transform = .init(scaleX: 0.8, y: 0.8)
    }
    
    @IBAction func tappedBackButton(_ sender: Any) {
        let chat = UIStoryboard(name: String(describing: ChatViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ChatViewController.self))
        
        navigationController?.pushViewController(chat, animated: true)
    }
    
    @IBAction func tappedReturnMessageButton(_ sender: Any) {
        sendButton.touchAnimation()
        sendMessage(text: messageTextField.text ?? "")
        pushMessage()
    }
}
extension CommunityGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = loadCurrentMessage(indexPath: indexPath)
        switch message.typeMessage {
            
        case .user:
            let cell = tableView.dequeueReusableCell(withIdentifier: OutgoingTextMessageTableViewCell.identifier, for: indexPath) as? OutgoingTextMessageTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
            
        case .contact:
            let cell = tableView.dequeueReusableCell(withIdentifier: IncomingTextMessageTableViewCell.identifier, for: indexPath) as? IncomingTextMessageTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow(indexPath: indexPath)
    }
}

extension CommunityGroupViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text as NSString? else { return false }
        let textAfterUpdate = text.replacingCharacters(in: range, with: string)
        
        if textAfterUpdate.isEmpty {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.sendButton.isEnabled = false
                self.sendButton.transform = .init(scaleX: 0.8, y: 0.8)
            }, completion: { _ in
            })
        } else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.sendButton.isEnabled = true
                self.sendButton.transform = .identity
            }, completion: { _ in
            })
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
