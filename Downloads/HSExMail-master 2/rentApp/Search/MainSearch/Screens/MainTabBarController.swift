//
//  MainTabBarController.swift
//  TestAirbnb
//
//  Created by Тагир Ракипов on 01.11.2020.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewControllers = [
            generateViewController(rootViewController: SearchViewController(), image: #imageLiteral(resourceName: "search-7"), title: "Search"),
            generateViewController(rootViewController: CategoriesViewController(), image: #imageLiteral(resourceName: "list-simple-star-7"), title: "Categories")
        ]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        
        return navigationVC
    }
}
