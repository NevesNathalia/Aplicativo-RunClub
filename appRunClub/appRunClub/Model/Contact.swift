//
//  Contact.swift
//  appRunClub
//
//  Created by Nathalia Neves on 11/07/24.
//

import Foundation

class Contact {
    
    var id: String?
    var name: String?

    init(dictionary: [String: Any]?) {
        self.id = dictionary?["id"] as? String
        self.name = dictionary?["nome"] as? String
    }
    
    convenience init(id: String?, name: String?) {
        self.init(dictionary: nil)
        self.id = id
        self.id = id
        
    }
}
