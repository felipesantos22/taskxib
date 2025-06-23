//
//  TabBarViewController.swift
//  taskXIB
//
//  Created by Felipe Santos on 19/06/25.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - View Controllers
    let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
    let finishedTableView = TableViewController(nibName: "TableViewController", bundle: nil)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UI Configuration
    func configureUI() {
        let homeNav = UINavigationController(rootViewController: homeViewController)
        homeViewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "checklist.unchecked"),
            tag: 0
        )
        
        let finishedNav = UINavigationController(rootViewController: finishedTableView)
        finishedTableView.tabBarItem = UITabBarItem(
            title: "Finalizados",
            image: UIImage(systemName: "checklist.checked"),
            tag: 1
        )
        
        viewControllers = [homeNav, finishedNav]
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.backgroundColor = .lightGray
    }
}

