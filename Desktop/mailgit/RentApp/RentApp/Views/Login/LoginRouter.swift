//
//  LoginRouter.swift
//  RentApp
//
//  Created by Melanie Kofman on 04.12.2020.
//

import UIKit
import Firebase


class LoginRouter: LoginRouterProtocol {
    weak var viewController: LoginViewController!
    var window: UIWindow?
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    func openMainTabBarController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = MainTabBarController()

    }
    
    func openRegistrationController() {
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.makeKeyAndVisible()
//        self.window?.rootViewController = RegistrationViewController()
        
        
        let controller = RegistrationViewController()
        controller.modalPresentationStyle = .popover
        self.viewController?.present(controller, animated: true, completion: nil)
    }
    
    
    
}
