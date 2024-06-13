//
//  HomeViewController.swift
//  appRunClub
//
//  Created by Otavio Astrath Leite on 16.05.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var runClubLogo: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableViewHome: UITableView!
    
    let feedUsers: [User] = [User(image: UIImage(named: "profile") ?? UIImage(), name: "Nome do Usuário", message:  "", location:  "Localização", description: "Breve descrição sobre o usuário"),
                             User(image: UIImage(named: "profile") ?? UIImage(), name: "Nome do Usuário", message:  "", location:  "Localização", description: "Breve descrição sobre o usuário"),
                             User(image: UIImage(named: "profile") ?? UIImage(), name: "Nome do Usuário", message:  "", location:  "Localização", description: "Breve descrição sobre o usuário"),
                             User(image: UIImage(named: "profile") ?? UIImage(), name: "Nome do Usuário", message:  "", location:  "Localização", description: "Breve descrição sobre o usuário")
    ]
    
    var lastContentOffSet: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configImage(image: runClubLogo)
        configButton(button: searchButton, image: UIImage(named: "add.icon") ?? UIImage(), title: "")
        configTableView()
        
    }
    
    private func configTableView() {
        tableViewHome.separatorStyle = .none
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
        tableViewHome.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    func configImage(image: UIImageView){
        image.image = UIImage(named: "logo.home")
    }
    
    func configButton(button: UIButton, image: UIImage, title: String) {
        button.setTitle(title, for: .normal)
        button.setImage(image, for: .normal)
        button.tintColor = .black
    }
    
    @IBAction func tappedSearchUsersButton(_ sender: Any) {
        
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return feedUsers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.setUpCell(data: feedUsers[indexPath.row])
        cell?.layer.borderWidth = 1.0
        cell?.layer.borderColor = UIColor.black.cgColor
        cell?.layer.cornerRadius = 12
        cell?.delegate(delegate: self)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? HomeTableViewCell {
            cell.setSelected(false, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 460
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 || section != 0 {
            tableView.backgroundColor =  UIColor(red: 164/255, green: 213/255, blue: 198/255, alpha: 0.37)
        }
        return nil
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffSet = scrollView.contentOffset.y
        
        if currentOffSet > lastContentOffSet || currentOffSet < lastContentOffSet {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        lastContentOffSet = currentOffSet
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func addUser(in cell: HomeTableViewCell, button: UIButton) {
        button.setTitle("Adicionado", for: .normal)
        button.setTitleColor(UIColor(red: 82/255, green: 183/255, blue: 136/255, alpha: 1.0), for: .disabled)
        button.isEnabled = false
    }
    
    func didTapIfoUser(in cell: HomeTableViewCell) {
        let infoUser = UIStoryboard(name: String(describing: InfoOtherUserViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: InfoOtherUserViewController.self))
        
        navigationController?.pushViewController(infoUser, animated: true)
    }
}
