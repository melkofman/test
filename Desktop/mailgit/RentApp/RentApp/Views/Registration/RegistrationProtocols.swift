//
//  RegistrationProtocols.swift
//  RentApp
//
//  Created by Melanie Kofman on 05.12.2020.
//

import UIKit

protocol RegistrationViewProtocol: class {
    func setView()
}

protocol RegistrationConfiguratorProtocol: class {
    func configure(with viewController: RegistrationViewController)
}

protocol RegistrationRouterProtocol: class {
    func openMainTabBarController()
    func returnBack()

}

protocol RegistrationPresenterProtocol: class {
    var router: RegistrationRouterProtocol! {set get}
    func configureView()
    func registration(email: String, password: String, phone: String, age: String)
    func openApp()
    func backAction()
    
    
}

protocol RegistrationInteractorProtocol {
    func regAction(email: String, password: String, phone: String, age: String)
    
}
