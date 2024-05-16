//
//  InfoOtherUserViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 16.05.24.
//

import UIKit

class InfoOtherUserViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelAboutMe: UILabel!
    @IBOutlet weak var aboutMeView: UIView!
    @IBOutlet weak var labelSportsInterest: UILabel!
    @IBOutlet weak var viewSportsInterest: UIView!
    @IBOutlet weak var labelLifestyle: UILabel!
    @IBOutlet weak var viewLifestyle: UIView!
    @IBOutlet weak var labelExtra: UILabel!
    @IBOutlet weak var viewExtra: UIView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            configImage(userPhoto: userPhoto, image: "person.circle.fill")
            configLabels(label: labelName, color: .black, font: .systemFont(ofSize: 27.0, weight: .semibold), text: "Otavio Astrath")
            configLabels(label: labelLocation, color: .black, font: .systemFont(ofSize: 14.0, weight: .medium), text: "Rio de Janeiro - RJ")
            configLabels(label: labelAboutMe, color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Sobre mim:")
            configViews(view: aboutMeView, borderRadius: 10.0, borderWidth: 0.0, clipsToBounds: true, borderColor: nil, backgroundColor: UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.37))
            configLabels(label: labelSportsInterest, color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Interesses Esportivos:")
            configViews(view: viewSportsInterest, borderRadius: 10.0, borderWidth: nil, clipsToBounds: true, borderColor: nil, backgroundColor: UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.37))
            configLabels(label: labelLifestyle, color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Estilo de vida:")
            configViews(view: viewLifestyle, borderRadius: 10.0, borderWidth: nil, clipsToBounds: true, borderColor: nil, backgroundColor: UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.37))
            configLabels(label: labelExtra, color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Extra:")
            configViews(view: viewExtra, borderRadius: 10.0, borderWidth: nil, clipsToBounds: true, borderColor: nil, backgroundColor: UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.37))
            
            
        }
        
        func configImage(userPhoto: UIImageView, image: String){
            userPhoto.image = UIImage(systemName: image)
        }
        
        func configLabels(label: UILabel, color: UIColor, font: UIFont, text: String){
            label.textColor = color
            label.font = font
            label.text = text
        }
        
        func configViews(view: UIView, borderRadius: CGFloat, borderWidth: CGFloat?, clipsToBounds: Bool, borderColor: CGColor?, backgroundColor: UIColor?){
            view.layer.cornerRadius = borderRadius
            view.layer.borderWidth = borderWidth ?? 0.0
            view.clipsToBounds = clipsToBounds
            view.layer.borderColor = borderColor
            view.backgroundColor = backgroundColor
        }


    }

