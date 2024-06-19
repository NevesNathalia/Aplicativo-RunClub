//
//  InfoOtherUserViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 16.05.24.
//

import UIKit

class InfoOtherUserViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    @IBOutlet weak var aboutMeView: UIView!
    @IBOutlet weak var sportsInterestLabel: UILabel!
    @IBOutlet weak var sportsInterestView: UIView!
    @IBOutlet weak var lifestyleLabel: UILabel!
    @IBOutlet weak var viewLifestyle: UIView!
    @IBOutlet weak var extraLabel: UILabel!
    @IBOutlet weak var extraView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        setupConfigElements()
       
        }
    func setupConfigElements() {
        configButton(button: backButton)
        configImage(imageView: userPhoto, image: "profile")
            configLabels(label: nameLabel, color: .black, font: .systemFont(ofSize: 27.0, weight: .semibold), text: "Nome do Usuário")
            configLabels(label: locationLabel, color: .black, font: .systemFont(ofSize: 14.0, weight: .medium), text: "Localização")
        configLabels(label: aboutMeLabel, color: .black, font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Sobre mim:")
          configViews(view: aboutMeView)
        configLabels(label: sportsInterestLabel, color: .black, font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Interesses Esportivos:")
          configViews(view: sportsInterestView)
        configLabels(label: lifestyleLabel, color: .black, font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Estilo de vida:")
        configViews(view: viewLifestyle)
        configLabels(label: extraLabel, color:.black, font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Extra:")
        configViews(view: extraView)
        
    }
    
    func configButton(button: UIButton) {
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "back.icon2"), for: .normal)
        
    }

    func configImage(imageView: UIImageView, image: String){
        imageView.image = UIImage(named: image)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        
        }
        
    func configLabels(label: UILabel, color: UIColor, font: UIFont, text: String){
        label.textColor = color
        label.font = font
        label.text = text
        }
        
    func configViews(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.19)
        }
    
    
    @IBAction func tappedBackButton(_ sender: Any) {
        let home = UIStoryboard(name: String(describing: HomeViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: HomeViewController.self))
        
        navigationController?.pushViewController(home, animated: true)
        
    }
    
    }

