//
//  ResetPasswordViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 31/03/24.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var resetLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabels(resetText: "Redefinir Senha", descriptionText: "Digite o e-mail associado à sua conta e enviaremos um e-mail com instruções para redefinir sua senha.", resetFont: .systemFont(ofSize: 30, weight: .medium), descriptionFont: .systemFont(ofSize: 20), resetColor: .green, aligment: .center)
        descriptionLabel.numberOfLines = 3
    }

    func configLabels(resetText: String, descriptionText: String, resetFont: UIFont, descriptionFont: UIFont, resetColor: UIColor, aligment: NSTextAlignment) {
        resetLabel.text = resetText
        descriptionLabel.text = descriptionText
        resetLabel.font = resetFont
        descriptionLabel.font = descriptionFont
        resetLabel.textColor = resetColor
        resetLabel.textAlignment = aligment
        descriptionLabel.textAlignment = aligment
    }
}
 
