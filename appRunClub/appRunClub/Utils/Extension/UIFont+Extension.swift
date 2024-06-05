//
//  UIFont+Extension.swift
//  appRunClub
//
//  Created by Nathalia Neves on 05/06/24.
//

import Foundation
import UIKit

extension UIFont {
    static func helveticaNeueMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
