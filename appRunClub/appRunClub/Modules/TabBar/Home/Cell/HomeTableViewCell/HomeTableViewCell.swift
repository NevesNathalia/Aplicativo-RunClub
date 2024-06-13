//
//  HomeTableViewCell.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 16.05.24.
//

import UIKit

protocol HomeTableViewCellDelegate: AnyObject {
    func didTapIfoUser(in cell: HomeTableViewCell)
    
    func addUser(in cell: HomeTableViewCell, button: UIButton)
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var userInfo: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userDescription: UILabel!
    @IBOutlet weak var addUserButton: UIButton!
    
    static let identifier: String = String(describing: HomeTableViewCell.self)
        
   private weak var delegate: HomeTableViewCellDelegate?
    
    public func delegate(delegate: HomeTableViewCellDelegate?) {
        self.delegate = delegate
    }
    
        static func nib() -> UINib {
            return UINib(nibName: identifier, bundle: nil)
        }
    
    var imageUsers: [FeedUsers] = [FeedUsers(previewImage: UIImage(named: "profile") ?? UIImage()),
                                   FeedUsers(previewImage: UIImage(named: "profile") ?? UIImage()),
                                   FeedUsers(previewImage: UIImage(named: "profile") ?? UIImage()),
                                   FeedUsers(previewImage: UIImage(named: "profile") ?? UIImage())
    ]
        
        override func awakeFromNib() {
            super.awakeFromNib()
            configCollectionView()
            configImage(image: userPhoto)
            configLabels(label: userName, font: .systemFont(ofSize: 16.0, weight: .semibold))
            configLabels(label: userLocation, font: .systemFont(ofSize: 14.0, weight: .thin))
            configLabels(label: userDescription, font: .systemFont(ofSize: 14.0, weight: .medium))
            configButton(button: userInfo, clipsToBounds: false, float: 0, text: "+ Informações", color: UIColor(red: 29/255, green: 27/255, blue: 32/255, alpha: 0.36))
            configButton(button: addUserButton, clipsToBounds: true, float: 20.0, text: "Adicionar", color: UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 1.0))
        }
        
    func configLabels(label: UILabel, font: UIFont) {
            label.font = font
        }
        
    func configImage(image: UIImageView) {
        image.layer.cornerRadius = 23
        }
        
        func configButton(button: UIButton, clipsToBounds: Bool, float: CGFloat, text: String, color: UIColor) {
            button.clipsToBounds = clipsToBounds
            button.layer.cornerRadius = float
            button.setTitle(text, for: .normal)
            button.tintColor = color
        }
        
        public func setUpCell(data: User) {
            userPhoto.image = data.image
            userName.text = data.name
            userLocation.text = data.location
            userDescription.text = data.description
        }
        
        private func configCollectionView(){
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.isAccessibilityElement = true
            
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
                layout.estimatedItemSize = .zero
            }
            
            collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        }
     
    
    @IBAction func tappedInfoUser(_ sender: Any) {
        delegate?.didTapIfoUser(in: self)

    }
    
    
    @IBAction func tappedAddUserButton(_ sender: Any) {
        delegate?.addUser(in: self, button: addUserButton)
    
    }
}
    extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imageUsers.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
            cell?.setUpCell(preview: imageUsers[indexPath.row])
            return cell ?? UICollectionViewCell()
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: contentView.frame.width, height: 350.0)
        }
    }

