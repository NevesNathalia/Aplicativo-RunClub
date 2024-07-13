//
//  ContactController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 11/07/24.
//

import Foundation
import UIKit
import FirebaseFirestore

protocol ContactProtocol: AnyObject {
    func alertStateError(title: String, message: String)
    func sucessContato()
}

class ContactController {
    
    private weak var delegate: ContactProtocol?
    
    public func delegate(delegate: ContactProtocol?) {
        self.delegate = delegate
    }
    
    func addContact(email: String, emailUserConnected: String, idUser: String) {
        if email == emailUserConnected {
            self.delegate?.alertStateError(title: "Você adicionou o seu próprio email", message: "Por favor, adicione um email diferente")
            return
        }
        
        //verifica se existe um usuario no firebase
        let firestore = Firestore.firestore()
        firestore.collection("usuários").whereField("email", isEqualTo: email).getDocuments { snapshotResult, error in
            
            
            //conta total de retorno
            if let totalItems = snapshotResult?.count {
                if totalItems == 0 {
                    self.delegate?.alertStateError(title: "Usuário não cadastrado", message: "Verifique o email e tente novamente")
                    return
                }
            }
            
            //salvar contato
            if let snapshot = snapshotResult {
                for document in snapshot.documents {
                    let data = document.data()
                    self.saveContact(dataContact: data, idUser: idUser)
                   
                }
            }
        }
    }
    
    func saveContact(dataContact: Dictionary<String, Any>, idUser: String) {
        
        let contact: Contact = Contact(dictionary: dataContact)
        let firestore: Firestore = Firestore.firestore()
        firestore.collection("usuários").document(idUser).collection("contatos").document(contact.id ?? "").setData(dataContact) {
            (error) in
            if error == nil {
                self.delegate?.sucessContato()
            }
        }
    }
}

