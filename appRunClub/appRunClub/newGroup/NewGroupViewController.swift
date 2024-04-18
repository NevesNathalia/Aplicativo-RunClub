//
//  NewGroupViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 18/04/24.
//

import UIKit

class NewGroupViewController: UIViewController {

    
    @IBOutlet weak var advanceButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configTextField(textField: searchTextField)
        configButton()
    }
    
    func configButton() {
        advanceButton.setTitle("Avançar", for: .normal)
        advanceButton.tintColor = .black
    }
    
    func configTextField(textField: UITextField) {
        textField.placeholder = "Pesquisar"
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.backgroundColor = UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.14)
        
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension NewGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
