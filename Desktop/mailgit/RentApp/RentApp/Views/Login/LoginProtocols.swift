//
//  LoginProtocols.swift
//  RentApp
//
//  Created by Melanie Kofman on 04.12.2020.
//

import UIKit

protocol LoginViewProtocol: class {
    func setView()
}

protocol LoginConfiguratorProtocol: class {
    func configure(with viewController: LoginViewController)
}

protocol LoginRouterProtocol: class {
    func openMainTabBarController()
    func openRegistrationController()

}

protocol LoginPresenterProtocol: class {
    var router: LoginRouterProtocol! {set get}
    func configureView()
    func login(email: String, password: String)
    func registration()
    func openApp()
    
}

protocol LoginInteractorProtocol {
    func loginAction(email: String, password: String)
}
