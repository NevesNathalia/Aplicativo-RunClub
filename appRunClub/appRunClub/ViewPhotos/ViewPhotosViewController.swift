//
//  ViewPhotosViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 23/04/24.
//

import UIKit

class ViewPhotosViewController: UIViewController {

    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configimageView(image: image1)
        configimageView(image: image2)
        configimageView(image: image3)
        configimageView(image: image4)
        configButton(button: closeButton)
    }
    
    func configimageView(image: UIImageView) {
        image.image = UIImage(named: "profile")
    }
    
    func configButton(button: UIButton) {
        button.setTitle("Fechar", for: .normal)
        button.tintColor = UIColor(red: 109/255, green: 181/255, blue: 139/255, alpha: 1.0)
    }

    @IBAction func tappedCloseButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
