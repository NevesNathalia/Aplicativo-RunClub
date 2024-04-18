//
//  NewGroupViewController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 18/04/24.
//

import UIKit

class NewGroupViewController: UIViewController {

    @IBOutlet weak var addMembersLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()

       
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
