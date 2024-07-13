//
//  User.swift
//  appRunClub
//
//  Created by Nathalia Neves on 11/07/24.
//

import Foundation

class User {
    
    var name: String?
    var email: String?

    init(dictionary: [String: Any]) {
        self.name = dictionary["nome"] as? String
        self.email = dictionary["email"] as? String
    }
}
