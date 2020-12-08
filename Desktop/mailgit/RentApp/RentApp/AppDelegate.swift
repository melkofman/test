//
//  AppDelegate.swift
//  RentApp
//
//  Created by Савва Шулятьев on 17.11.2020.
//

import UIKit
import Firebase
@UIApplicationMain
//@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        //self.window?.rootViewController = MainTabBarController()
        self.window?.rootViewController = LoginViewController()
        FirebaseApp.configure()
        return true
    }
}

