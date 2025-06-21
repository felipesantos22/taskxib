//
//  TabBarViewController.swift
//  taskXIB
//
//  Created by Felipe Santos on 19/06/25.
//

import UIKit

class TabBarViewController: UIViewController , UITabBarDelegate{

    
    @IBOutlet weak var tabbar: UITabBar!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tabbar.delegate = self
        
    }
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            showHome()
        case 1:
            showFavorites()
        default:
            break
        }
    }
    
    private func showHome() {
        print("Mostrando Home")
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    private func showFavorites() {
        print("Mostrando Favoritos")
    }
    
}
