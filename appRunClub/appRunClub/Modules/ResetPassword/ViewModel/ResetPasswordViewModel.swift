//
//  ResetPasswordViewModel.swift
//  appRunClub
//
//  Created by Nathalia Neves on 19/06/24.
//

import UIKit

class ResetPasswordViewModel {
    
    func validadeEmail(_ email: String) -> Bool {
        if email.isEmpty || ((!email.localizedStandardContains("@")) || (!email.localizedStandardContains(".com"))) {
            return false
        } else {
            return true
        }
    }
}
