//
//  Conversation.swift
//  appRunClub
//
//  Created by Nathalia Neves on 11/07/24.
//

import Foundation

class Conversation {
    
    var name: String?
    var lastMessage: String?
    var idRecipient: String?
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["nomeUsuario"] as? String
        self.lastMessage = dictionary["ultimaMensagem"] as? String
        self.lastMessage = dictionary["idDestinatario"] as? String
    }
}
