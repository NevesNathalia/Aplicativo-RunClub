//
//  Alert.swift
//  appRunClub
//
//  Created by Gabriel Mors  on 13/06/24.
//

import UIKit

class Alert {
    var controller: UIViewController?
    
    init(controller: UIViewController? = nil) {
        self.controller = controller
    }
    
    public func createAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .cancel) { (_) in
            completion?()
        }
    
        alertController.addAction(confirmAction)
        self.controller?.present(alertController, animated: true)
    }
    
    public func exitAcount(title: String, message: String, completion : ((Bool)-> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Sim", style: .destructive) { action in
            completion?(true)
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        self.controller?.present(alertController, animated: true, completion: nil)
    }
    
    func addContact(completion:((_ value:String) -> Void)? = nil){
        var _textField:UITextField?
      
        let alert = UIAlertController(title: "Adicionar Usuário", message: "Digite um email Válido", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Adicionar", style: .default) { (acao) in
            completion?(_textField?.text ?? "")
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: {(textField: UITextField) in
            _textField = textField
            textField.placeholder = "Email:"
        })
        self.controller?.present(alert, animated: true, completion: nil)
    }
}

 
