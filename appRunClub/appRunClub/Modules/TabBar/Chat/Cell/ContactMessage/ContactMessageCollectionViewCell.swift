//
//  ContactMessageCollectionViewCell.swift
//  appRunClub
//
//  Created by Nathalia Neves on 11/07/24.
//

import UIKit

class ContactMessageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var nameContactLabel: UILabel!
    
    static let identifier: String = String(describing: ContactMessageCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configImage()
        configLabel()
    }
    
    private func configImage() {
        contactImageView.image = UIImage(systemName: "person.fill")
        contactImageView.clipsToBounds = true
        contactImageView.layer.cornerRadius = 26
    }
    
    private func configLabel() {
        nameContactLabel.numberOfLines = 2
    }
    
    public func setupViewContact(contact: Contact) {
        self.setupNameContact(nameContact: contact.name ?? "")
    }
    
    public func setupViewConversation(conversation: Conversation) {
        self.setNameContactAttributedText(conversation)
    }
    
    func setNameContactAttributedText(_ conversation: Conversation) {
        let attributText = NSMutableAttributedString(string: "\(conversation.name ?? "")", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        attributText.append(NSAttributedString(string: "\n\(conversation.lastMessage ?? "")", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        
    }
    
    func setupNameContact(nameContact: String) {
        let attributText = NSMutableAttributedString(string: nameContact, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium), NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        self.nameContactLabel.attributedText = attributText
    }

}
