//
//  UserTableViewCell.swift
//  appRunClub
//
//  Created by Nathalia Neves on 17/04/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var mensageLabel: UILabel!
    
    static let identifier: String = String(describing: UserTableViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configLabels()
        
    }
    
    func configLabels() {
        nameUserLabel.font = .systemFont(ofSize: 16, weight: .regular)
        mensageLabel.font = .systemFont(ofSize: 14, weight: .regular)
        mensageLabel.tintColor = UIColor(red: 73/255, green: 69/255, blue: 79/255, alpha: 1.0)
    }
    
    public func setupCell(data: User) {
        userImageView.image = data.image
        nameUserLabel.text = data.name
        mensageLabel.text = data.mensage
    }
}
