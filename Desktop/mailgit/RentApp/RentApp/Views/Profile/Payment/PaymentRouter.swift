//
//  PaymentRouter.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit

class PaymentRouter: PaymentRouterProtocol {
    weak var viewController: PaymentViewController!
    var window: UIWindow?
    init(viewController: PaymentViewController) {
        self.viewController = viewController
    }
    
    func methods() {
        
        let controller = MethodsViewController()
        controller.modalPresentationStyle = .popover
        self.viewController?.present(controller, animated: true, completion: nil)
        
        
    }
    
    func settings() {
        let controller = SettingsViewController()
               controller.modalPresentationStyle = .popover
               self.viewController?.present(controller, animated: true, completion: nil)
    }
    
    func statistics() {
        let controller = StatisticsViewController()
               controller.modalPresentationStyle = .popover
               self.viewController?.present(controller, animated: true, completion: nil)
    }
}
