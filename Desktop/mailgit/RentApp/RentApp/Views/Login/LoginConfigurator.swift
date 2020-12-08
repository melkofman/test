//
//  LoginConfigurator.swift
//  RentApp
//
//  Created by Melanie Kofman on 04.12.2020.
//

import UIKit

class LoginConfigurator: LoginConfiguratorProtocol {
    func configure(with viewController: LoginViewController){
        let presenter = LoginPresenter(view: viewController)
        let interactor = LoginInteractor(presenter: presenter)
        let router = LoginRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
