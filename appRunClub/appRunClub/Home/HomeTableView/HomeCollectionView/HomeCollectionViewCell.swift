//
//  HomeCollectionViewCell.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 17.05.24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var userPhotos: UIImageView!
    
    static let identifier: String = String(describing: HomeCollectionViewCell.self)
        
        static func nib() -> UINib {
            return UINib(nibName: identifier, bundle: nil)
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
        }
        
        public func setUpCell(preview: FeedUsers) {
            userPhotos.image = preview.previewImage
        }

    }

