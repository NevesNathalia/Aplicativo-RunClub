//
//  ContactsTableViewCell.swift
//  appRunClub
//
//  Created by Nathalia Neves on 18/04/24.
//

import UIKit

protocol ContactsTableViewCellDelegate: AnyObject {
    func selectContact(in cell: ContactsTableViewCell, button: UIButton)
}

class ContactsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var nameContactLabel: UILabel!
    @IBOutlet weak var squareButton: UIButton!
    
    static let identifier: String = String(describing: ContactsTableViewCell.self)
    
    private weak var delegate: ContactsTableViewCellDelegate?
    
    public func delegate(delegate: ContactsTableViewCellDelegate?) {
        self.delegate = delegate
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configImage(image: contactImage)
    }
    
    func configImage(image: UIImageView) {
        image.layer.cornerRadius = 20
    }
    
    func configButton() {
        squareButton.setImage(UIImage(systemName: "square"), for: .normal)
        squareButton.tintColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
    }
    
    
    @IBAction func tappedSelectUserButton(_ sender: Any) {
        delegate?.selectContact(in: self, button: squareButton)
    }
    
    public func setupCell(details: Contacts) {
        contactImage.image = details.image
        nameContactLabel.text = details.name
        
        if details.isEnableButton {
            squareButton.setImage(UIImage(systemName: "square"), for: .normal)
            squareButton.tintColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
               } else {
                   squareButton.setImage(UIImage(systemName: "square"), for: .normal)
                   squareButton.tintColor = .blue
               }
    }
    
}
