
//
//  ObserveChatsProtocols.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

protocol ObserveChatsConfiguratorProtocol: class {
    func configure(with viewController: ObserveChatsViewController)
}

protocol ObserveChatsPresenterProtocol: class {
    var router: ObserveChatsRouterProtocol! {set get}
    func configureView()
    func chatClicked(user: User)
    func setUserName(user: User, chatViewController: ChatViewController)

    
}

protocol ObserveChatsViewProtocol: class {
    func setView()
}

protocol ObserveChatsInteractorProtocol: class {
    func changeName(name: String, chatViewController: ChatViewController)
    
}

protocol ObserveChatsRouterProtocol: class {

    func showChat(_ user: User)
}
