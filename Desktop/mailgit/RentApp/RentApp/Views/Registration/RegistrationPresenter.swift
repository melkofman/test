//
//  RegistrationPresenter.swift
//  RentApp
//
//  Created by Melanie Kofman on 05.12.2020.
//

import UIKit

class RegistrationPresenter: RegistrationPresenterProtocol {
    weak var view: RegistrationViewProtocol!
    var interactor: RegistrationInteractorProtocol!
    var router: RegistrationRouterProtocol!
    
    required init(view: RegistrationViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        view.setView()
    }
    
    func registration(email: String, password: String, phone: String, age: String) {
        interactor.regAction(email: email, password: password, phone: phone, age: age)
    }
    
    func openApp() {
        router.openMainTabBarController()
    }
    
    func backAction() {
        router.returnBack()
    }
}
