//
//  PaymentProtocols.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//
import UIKit

protocol PaymentViewProtocol: class {
    func setView()
}

protocol PaymentConfiguratorProtocol: class {
    func configure(with viewController: PaymentViewController)
}

protocol PaymentRouterProtocol: class {
    func methods()
    func settings()
    func statistics()

}

protocol PaymentPresenterProtocol: class {
    var router: PaymentRouterProtocol! {set get}
    func configureView()
    func methods()
    func settings()
    func statistics()
}

protocol PaymentInteractorProtocol {
 
}
