//
//  ChatViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 17/04/24.
//

import UIKit
import Firebase
import FirebaseFirestore

enum TypeConversationOrContact {
    case conversation
    case contact
}

protocol NavViewProtocol: AnyObject {
    func typeScreenMessage(type: TypeConversationOrContact)
}

class ChatViewController: UIViewController {

    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var conversationButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak private var delegate: NavViewProtocol?
    
    func delegate(delegate: NavViewProtocol?) {
        self.delegate = delegate
    }
    
    var viewModel: ChatViewModel = ChatViewModel()
    
    var auth: Auth?
    var db: Firestore?
    var idUserLogged: String?
    
    var screenContact: Bool?
    var emailUserLogged: String?
    
    var alert: Alert?
    
    var contact: ContactController?
    var listContact: [Contact] = []
    var listConversation: [Conversation] = []
    var conversationListener: ListenerRegistration?
    var isContactButtonSelected = true
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabel(label: chatLabel)
        view.backgroundColor = UIColor(red: 226/255, green: 247/255, blue: 239/255, alpha: 1.0)
        configButton(button: conversationButton, image: UIImage(systemName: "message") ?? UIImage())
        configButton(button: contactButton, image: UIImage(systemName: "person.2") ?? UIImage())
        configColectionView()
        configAlert()
        configIdentifierFirebase()
        configContact()
        addListenerRecoverConversation()
    }
    
    private func configLabel(label: UILabel) {
        label.text = "Chat"
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.textColor = UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0)
    }
    
    private func configButton(button: UIButton, image: UIImage) {
        button.setTitle("", for: .normal)
        button.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor =  UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0)
    }
    
    private func configColectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delaysContentTouches = false
        collectionView.register(AddContactCollectionViewCell.nib(), forCellWithReuseIdentifier: AddContactCollectionViewCell.identifier)
        collectionView.register(ContactMessageCollectionViewCell.self, forCellWithReuseIdentifier: ContactMessageCollectionViewCell.identifier)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
    }
    
    public func reloadCollectionView() {
        self.collectionView.reloadData()
    }
    
    private func configAlert() {
        self.alert = Alert(controller: self)
    }
    
    private func configIdentifierFirebase() {
        self.auth = Auth.auth()
        self.db = Firestore.firestore() //banco de dados
        
        //recuperar id do usuario logado
        if let currentUser = auth?.currentUser {
            self.idUserLogged = currentUser.uid
            self.emailUserLogged = currentUser.email
        }
    }
    
    private func configContact() {
        self.contact = ContactController()
        self.contact?.delegate(delegate: self)
    }
    //Observador
    func addListenerRecoverConversation() {
        if let idUserLogged = auth?.currentUser?.uid {
            self.conversationListener =
            db?.collection("conversas").document(idUserLogged).collection("ultimas_converas").addSnapshotListener({ querySnapshot, error in
                
                if error == nil {
                    self.listConversation.removeAll()
                    
                    if let snapshot = querySnapshot {
                        for document in snapshot.documents{
                            let data = document.data()
                            self.listConversation.append(Conversation(dictionary: data))
                        }
                        self.reloadCollectionView()
                    }
                }
            })
        }
            
    }
    
    func getContact() {
        self.listContact.removeAll()
        self.db?.collection("usuarios").document(self.idUserLogged ?? "").collection("contatos").getDocuments(completion: { snapShotResult, error in
            
            if error != nil {
                print("get error")
                return
            }
            
            if let snapshot = snapShotResult {
                
                for document in snapshot.documents {
                    let dataContact = document.data()
                    self.listContact.append(Contact(dictionary: dataContact))
                }
                self.reloadCollectionView()
            }
        })
        
    }
    
    @IBAction func tappedConversationButton(_ sender: Any) {
        self.delegate?.typeScreenMessage(type: .conversation)
        self.conversationButton.setImage(UIImage(systemName: "message"), for: .normal)
        self.conversationButton.tintColor =  UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0)
    }
    
    @IBAction func tappedContactButton(_ sender: Any) {
        self.delegate?.typeScreenMessage(type: .contact)
        self.contactButton.setImage(UIImage(systemName: "person.2.fill"), for: .normal)
        self.contactButton.tintColor =  UIColor(red: 27/255, green: 67/255, blue: 50/255, alpha: 1.0)
    }
    
}

extension ChatViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.screenContact ?? false {
            return listContact.count + 1
        } else {
            return self.listConversation.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.screenContact ?? false {
            if indexPath.row == self.listContact.count {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddContactCollectionViewCell.identifier, for: indexPath) as? AddContactCollectionViewCell
                return cell ?? UICollectionViewCell()
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactMessageCollectionViewCell.identifier, for: indexPath) as? ContactMessageCollectionViewCell
                cell?.setupViewContact(contact: self.listContact[indexPath.row])
                return cell ?? UICollectionViewCell()
            }
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactMessageCollectionViewCell.identifier, for: indexPath) as? ContactMessageCollectionViewCell
            cell?.setupViewConversation(conversation: self.listConversation[indexPath.row])
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

extension ChatViewController: NavViewProtocol {
    func typeScreenMessage(type: TypeConversationOrContact) {
        switch type {
        case .contact:
            self.screenContact = true
            self.getContact()
            self.conversationListener?.remove()
            
        case .conversation:
            self.screenContact = false
            self.addListenerRecoverConversation()
            self.reloadCollectionView()
        }
    }
    
}

extension ChatViewController: ContactProtocol {
    func alertStateError(title: String, message: String) {
        self.alert?.createAlert(title: title, message: message)
    }
    
    func sucessContato() {
        self.alert?.createAlert(title: "Parabéns!!", message: "Você tem uma nova conexão", completion: {
            self.getContact()
        })
    }
}

