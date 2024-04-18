//
//  ContactsTableViewCell.swift
//  appRunClub
//
//  Created by Nathalia Neves on 18/04/24.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var nameContactLabel: UILabel!
    @IBOutlet weak var squareButton: UIButton!
    
    static let identifier: String = String(describing: ContactsTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contactImage.tintColor = .systemGray
    }
    
    @IBAction func tappedEnableButton(_ sender: Any) {
        squareButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        squareButton.tintColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    public func setupCell(details: Contacts) {
        contactImage.image = details.image
        nameContactLabel.text = details.name
        
        if details.isEnabled {
            squareButton.setImage(UIImage(systemName: "square"), for: .normal)
            squareButton.tintColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
        } else {
            squareButton.tintColor = .red
        }
    }
    
}
