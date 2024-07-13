//
//  TextMessage.swift
//  appRunClub
//
//  Created by Nathalia Neves on 11/07/24.
//

import Foundation

class TextMessage {
    var text: String?
    var idUser: String?
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["texto"] as? String
        self.idUser = dictionary["idUsuario"] as? String
    }
}
