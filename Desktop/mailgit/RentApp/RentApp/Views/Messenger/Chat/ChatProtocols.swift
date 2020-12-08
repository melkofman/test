
//
//  ChatProtocols.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

protocol ChatViewProtocol: class {
    func setView()
}

protocol ChatConfiguratorProtocol: class {
    func configure(with viewController: ChatViewController)
}

protocol ChatRouterProtocol: class {
    func backClicked()
}

protocol ChatPresenterProtocol: class {
    var router: ChatRouterProtocol! {set get}
    func configureView()
    func handleBack()
    func decideHelperOrNot(name: String, chatViewController: ChatViewController)
    func decideColor(from: String) -> Bool
    func sendMessage(newmessage: String, chatViewController: ChatViewController)
}

protocol ChatInteractorProtocol {
    func helperOrNot(name: String, chatViewController: ChatViewController)
    func decideCellColor(from: String) -> Bool
    func sendMessage(newmessage: String, chatViewController: ChatViewController)
}
