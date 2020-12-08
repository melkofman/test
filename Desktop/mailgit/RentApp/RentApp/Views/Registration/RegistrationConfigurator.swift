//
//  RegistrationConfigurator.swift
//  RentApp
//
//  Created by Melanie Kofman on 05.12.2020.
//

import UIKit

class RegistrationConfigurator: RegistrationConfiguratorProtocol {
    func configure(with viewController: RegistrationViewController){
        let presenter = RegistrationPresenter(view: viewController)
        let interactor = RegistrationInteractor(presenter: presenter)
        let router = RegistrationRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

