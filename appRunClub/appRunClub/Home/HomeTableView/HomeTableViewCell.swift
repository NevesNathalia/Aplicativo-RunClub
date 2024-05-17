//
//  HomeTableViewCell.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 16.05.24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userDescription: UILabel!
    @IBOutlet weak var addUserButton: UIButton!
    
    static let identifier: String = String(describing: HomeTableViewCell.self)
        
        
        static func nib() -> UINib {
            return UINib(nibName: identifier, bundle: nil)
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            //configCollectionView()
            configImage()
            configLabels(label: userName, texts: "Otavio Astrath", font: .systemFont(ofSize: 16.0, weight: .semibold))
            configLabels(label: userLocation, texts: "Florianópolis - SC", font: .systemFont(ofSize: 14.0, weight: .thin))
            configLabels(label: userDescription, texts: "Sou apaixonado por esportes de todos os tipos", font: .systemFont(ofSize: 14.0, weight: .medium))
            configButton(button: addUserButton, clipsToBounds: true, float: 100.0, text: "Adicionar", color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0))
        }
        
        func configLabels(label: UILabel, texts: String, font: UIFont ) {
            label.text = texts
            label.font = font
        }
        
        func configImage() {
            userPhoto.image = UIImage(systemName: "person.circle.fill")
            userPhoto.tintColor = .systemGray3
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
            collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        }
        
        @IBAction func tappedButtonCollectionView(_ sender: UIButton) {
            
        }
        
    }

    extension HomeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell
            
            return cell ?? UICollectionViewCell()
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: contentView.frame.width, height: 470.0)
        }
    }

