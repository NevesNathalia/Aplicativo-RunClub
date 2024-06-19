//
//  NewUserTableViewCell.swift
//  appRunClub
//
//  Created by Nathalia Neves on 16/06/24.
//

import UIKit

class NewUserTableViewCell: UITableViewCell {

    @IBOutlet weak var ContactImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    static let identifier: String = String(describing: NewUserTableViewCell.self)
        
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configImage(image: ContactImage)
        configLabel(label: nameLabel, font: .systemFont(ofSize: 16, weight: .medium))
        configLabel(label: location, font: .systemFont(ofSize: 14, weight: .regular))
        configButton(button: addButton)
        
    }
    
    func configImage(image: UIImageView) {
        image.layer.cornerRadius = 25
    }
    
    func configLabel(label: UILabel, font: UIFont) {
        label.font = font
    }
    
    func configButton(button: UIButton) {
        button.setTitle("+ Adicionar", for: .normal)
        button.tintColor = UIColor(red: 29/255, green: 27/255, blue: 32/255, alpha: 0.36)
    }
    
    @IBAction func tappedAddNewUserButton(_ sender: Any) {
       userAdded()
    }
     
    func userAdded() {
        addButton.setTitle("", for: .normal)
        addButton.setImage(UIImage(named: "check.icon"), for: .normal)
    }
    
    func setupCell(details: User) {
        ContactImage.image = details.image
        nameLabel.text = details.name
        location.text = details.location
    }

}
