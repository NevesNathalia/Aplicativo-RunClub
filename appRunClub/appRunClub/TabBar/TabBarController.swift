//
//  TabBarController.swift
//  appRunClub
//
//  Created by Nathalia Neves on 23/04/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
         super.viewDidLoad()
        addControllers()
        configLayoutTabBar()
    }
    
    func addControllers() {
        
        let firstViewController : UINavigationController = {
            let viewController = UIStoryboard(name: String(describing: HomeViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController
            let navigation = UINavigationController(rootViewController: viewController ?? UIViewController())
            navigation.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
            navigation.navigationBar.backgroundColor = UIColor(red: 8/255, green: 32/255, blue: 22/255, alpha: 1.0)
            
            return navigation
        }()
        
        let secondViewController : UINavigationController = {
            let viewController = UIStoryboard(name: String(describing: ChatViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ChatViewController.self)) as? ChatViewController
            let navigation = UINavigationController(rootViewController: viewController ?? UIViewController())
            navigation.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(systemName: "message"), tag: 1)
            navigation.navigationBar.backgroundColor = UIColor(red: 8/255, green: 32/255, blue: 22/255, alpha: 1.0)

            return navigation
        }()
        
        let lastViewController : UINavigationController = {
            let viewController = UIStoryboard(name: String(describing: ProfileUserViewController.self), bundle: nil).instantiateViewController(withIdentifier: String(describing: ProfileUserViewController.self)) as? ProfileUserViewController
            let navigation = UINavigationController(rootViewController: viewController ?? UIViewController())
            navigation.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person"), tag: 2)
            navigation.navigationBar.backgroundColor = UIColor(red: 8/255, green: 32/255, blue: 22/255, alpha: 1.0)

            return navigation
        }()
        
        viewControllers = [firstViewController, secondViewController, lastViewController]
    }
    
    func configLayoutTabBar() {
        tabBar.backgroundColor = UIColor(red: 78/255, green: 137/255, blue: 109/255, alpha: 1.0)
        tabBar.tintColor = .white
    }
 
}
