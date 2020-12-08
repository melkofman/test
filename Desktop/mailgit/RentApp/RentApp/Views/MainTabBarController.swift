//
//  MainTabBarController.swift
//  RentApp
//
//  Created by Савва Шулятьев on 17.11.2020.
//

import UIKit


class MainTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        installationAllViewControllers()
        customizationTabBar()
      }
    
    
    // MARK: - Private Methods
    
    private func customizationTabBar() {
        tabBar.tintColor = .systemPink
    }
    
    private func installationViewController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    private func installationAllViewControllers() {
        
        viewControllers = [
            installationViewController(rootViewController: SearchViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass")!),
            installationViewController(rootViewController: SavesViewController(), title: "Saves", image: UIImage(systemName: "heart")!),
            installationViewController(rootViewController: TravelViewController(), title: "Travel", image: UIImage(systemName: "x.square")!),
            installationViewController(rootViewController: ObserveChatsViewController(), title: "Inbox", image: UIImage(systemName: "bubble.right")!),
            installationViewController(rootViewController: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person")!)
        ]
        
        }
}
