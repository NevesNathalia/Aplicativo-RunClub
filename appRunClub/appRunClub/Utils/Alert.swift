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
}
