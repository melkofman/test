//
//  MainTabBarController.swift
//  rentApp
//
//  Created by Савва Шулятьев on 10.11.2020.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        tabBar.tintColor = .systemPink
        //tabBar.unselectedItemTintColor = .gray
        //self.view.bringSubviewToFront(self.tabBar)
        

        let mainSearchVC = MainSearchController()
        let navigationSearch = UINavigationController(rootViewController: mainSearchVC)
        mainSearchVC.tabBarItem.image = UIImage(systemName: "map")
        mainSearchVC.tabBarItem.title = "map"
        
        let messengerVC = ObserveChats()
        let navigationChats = UINavigationController(rootViewController: messengerVC)
        navigationChats.tabBarItem.image = UIImage(systemName: "bubble.right")
        navigationChats.tabBarItem.title = "Inbox"
        
        //person
        //globe
        //suit.heart

        let searchVC = SearchViewController()
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchVC.tabBarItem.title = "Search"
//
//        let searchVC = SearchViewController()
//        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
//        searchVC.tabBarItem.title = "Search"
//
//        let searchVC = SearchViewController()
//        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
//        searchVC.tabBarItem.title = "Search"
        
        
        
        let profileVC = ViewController()
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        profileVC.tabBarItem.title = "Profile"
        
        
        viewControllers = [
            navigationSearch,
            searchVC,
            navigationChats,
            profileVC
        ]
        
//        func generateViewContoller(rootViewControllew: UIViewController, image: UIImage, title: String) -> UIViewController {
//            rootViewControllew.tabBarItem.title = title
//            rootViewControllew.tabBarItem.image = image
//            return rootViewControllew
        //}
    }
}
