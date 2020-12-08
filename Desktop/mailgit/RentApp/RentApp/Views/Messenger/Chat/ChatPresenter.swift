
//
//  ChatPresentor.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ChatPresenter: ChatPresenterProtocol {
    weak var view: ChatViewProtocol!
    var interactor: ChatInteractorProtocol!
    var router: ChatRouterProtocol!
    
    required init(view: ChatViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        view.setView()
    }
    
    func handleBack() {
        router.backClicked()
    }
    
    func decideHelperOrNot(name: String, chatViewController: ChatViewController) {
        interactor.helperOrNot(name: name, chatViewController: chatViewController)
    }
    
    func decideColor(from: String) -> Bool {
        return interactor.decideCellColor(from: from)
    }
    
    func sendMessage(newmessage: String, chatViewController: ChatViewController) {
        interactor.sendMessage(newmessage: newmessage, chatViewController: chatViewController)
    }
    
}

