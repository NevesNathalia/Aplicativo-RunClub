//
//  Message.swift
//  appRunClub
//
//  Created by Nathalia Neves on 04/06/24.
//

import Foundation

enum TypeMessage {
    case user
    case contact 
}

struct Message {
    var message: String
//    var date: Date
    var typeMessage: TypeMessage
}
