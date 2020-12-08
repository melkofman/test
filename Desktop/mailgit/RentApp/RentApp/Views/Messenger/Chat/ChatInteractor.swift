
//
//  ChatInteractor.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ChatInteractor: ChatInteractorProtocol {
    private let texthelper = "Напишите нам, если у Вас возникли проблемы. Наши операторы свяжутся с Вами для помощи."
    weak var presenter: ChatPresenterProtocol!
    
    required init(presenter: ChatPresenterProtocol) {
        self.presenter = presenter
    }
    
    func helperOrNot(name: String, chatViewController: ChatViewController) {
        if ((name.caseInsensitiveCompare("helper")) == .orderedSame) {
            let message = Message(text: texthelper, from: "helper")
            chatViewController.messages.append(message)
        }
    }
    
    func decideCellColor(from: String) -> Bool {
        if (from.caseInsensitiveCompare("user") == .orderedSame) {
            return true
        }
        else {return false}
    }
    
    func sendMessage(newmessage: String, chatViewController: ChatViewController) {
        if !newmessage.isEmpty{
            let message = Message(text: newmessage, from: "user")
            chatViewController.messages.append(message)
            
           
        }
        
        
        
    }
   
    
}
