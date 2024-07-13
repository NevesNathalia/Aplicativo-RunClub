//
//  AddContactCollectionViewCell.swift
//  appRunClub
//
//  Created by Nathalia Neves on 11/07/24.
//

import UIKit

class AddContactCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var addContactImageView: UIImageView!
    @IBOutlet weak var addContactLabel: UILabel!
    
    static let identifier: String = String(describing: AddContactCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configImage()
        configLabel()
    }
    
    private func configImage() {
        addContactImageView.image = UIImage(systemName: "person.badge.plus")
        addContactImageView.backgroundColor =  UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 1.0)
    }
    
    private func configLabel() {
        addContactLabel.text = "Adicionar novo Contato"
        addContactLabel.textColor = .darkGray
        addContactLabel.font = .systemFont(ofSize: 16)
        addContactLabel.numberOfLines = 2
    }

}
