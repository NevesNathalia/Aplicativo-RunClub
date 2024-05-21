//
//  HomeViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 16.05.24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var runClubLogo: UIImageView!
    @IBOutlet weak var hamburgerIcon: UIImageView!
    @IBOutlet weak var magnifyingGlass: UIImageView!
    @IBOutlet weak var tableViewHome: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            configImages()
            configTableView()
        }
        
        private func configTableView() {
            tableViewHome.delegate = self
            tableViewHome.dataSource = self
            tableViewHome.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
        }

        func configImages(){
            runClubLogo.image = .logo
            magnifyingGlass.tintColor = .black
            hamburgerIcon.tintColor = .black
        }
    }

    extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
            cell?.setUpCell(data: User(image: UIImage(named: "person.circle.fill") ?? UIImage(), name: "Nome do Usuário", mensage: "", location: "Localização", description: "descrição"))
            return cell ?? UITableViewCell()
        }
    }

