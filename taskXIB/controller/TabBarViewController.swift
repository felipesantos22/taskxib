//
//  TabBarViewController.swift
//  taskXIB
//
//  Created by Felipe Santos on 19/06/25.
//

import UIKit

class TabBarViewController: UITabBarController{
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    func configureUI(){
        
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        
        let finishedTableView = TableViewController(nibName: "TableViewController", bundle: nil)
        finishedTableView.tabBarItem = UITabBarItem(title: "Finalizados", image: nil, tag: 1)
        
        viewControllers = [homeViewController, finishedTableView]
        
        tabBar.isTranslucent = false
        
        tabBar.tintColor = .black
        
        
    }
    
    
    
}
