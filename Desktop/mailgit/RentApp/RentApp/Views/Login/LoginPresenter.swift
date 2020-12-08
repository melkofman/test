//
//  LoginPresenter.swift
//  RentApp
//
//  Created by Melanie Kofman on 04.12.2020.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol!
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterProtocol!
    
    required init(view: LoginViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        view.setView()
    }
    func login(email: String, password: String) {
        interactor.loginAction(email: email, password: password)
    }
    func registration() {
        
        router.openRegistrationController()
        
    }
    
    func openApp() {
        router.openMainTabBarController()
    }
}
