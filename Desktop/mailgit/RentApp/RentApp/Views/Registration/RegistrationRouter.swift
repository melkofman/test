//
//  RegistrationRouter.swift
//  RentApp
//
//  Created by Melanie Kofman on 05.12.2020.
//

import UIKit
import Firebase


class RegistrationRouter: RegistrationRouterProtocol {
    weak var viewController: RegistrationViewController!
    var window: UIWindow?
    init(viewController: RegistrationViewController) {
        self.viewController = viewController
    }
    
    func openMainTabBarController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = MainTabBarController()

    }
    
    func returnBack() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = LoginViewController()
    }
}
