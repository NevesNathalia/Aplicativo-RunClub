//
//  InfoOtherUserViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 16.05.24.
//

import UIKit

class InfoOtherUserViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            configImage(fotoDePerfil: fotoDePerfil, image: "person.circle.fill")
            configLabels(label: labelNome, color: .black, font: .systemFont(ofSize: 27.0, weight: .semibold), text: "Otavio Astrath")
            configLabels(label: labelLocalizacao, color: .black, font: .systemFont(ofSize: 14.0, weight: .medium), text: "Rio de Janeiro - RJ")
            configLabels(label: labelSobreMim, color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Sobre mim:")
            configViews(view: sobreMimView, borderRadius: 10.0, borderWidth: 0.0, clipsToBounds: true, borderColor: nil, backgroundColor: UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.37))
            configLabels(label: textoSobreMim, color: .black, font: .systemFont(ofSize: 14.0, weight: .semibold), text: "teste")
            configLabels(label: labelInteressesEsportivos, color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Interesses Esportivos:")
            configViews(view: InteressesEsportivosView, borderRadius: 10.0, borderWidth: nil, clipsToBounds: true, borderColor: nil, backgroundColor: UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.37))
            configLabels(label: textoInteressesEsportivos, color: .black, font: .systemFont(ofSize: 14.0, weight: .semibold), text: "teste")
            configLabels(label: labelEstiloDeVida, color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Estilo de vida:")
            configViews(view: estiloDeVidaView, borderRadius: 10.0, borderWidth: nil, clipsToBounds: true, borderColor: nil, backgroundColor: UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.37))
            configLabels(label: textoEstiloDeVida, color: .black, font: .systemFont(ofSize: 14.0, weight: .semibold), text: "teste")
            configLabels(label: labelExtra, color: UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0), font: .systemFont(ofSize: 16.0, weight: .semibold), text: "Extra:")
            configViews(view: extraView, borderRadius: 10.0, borderWidth: nil, clipsToBounds: true, borderColor: nil, backgroundColor: UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.37))
            configLabels(label: textoExtra, color: .black, font: .systemFont(ofSize: 14.0, weight: .semibold), text: "teste")
            
            
        }
        
        func configImage(fotoDePerfil: UIImageView, image: String){
            fotoDePerfil.image = UIImage(systemName: image)
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

