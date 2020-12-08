
//
//  ObserveChatsRouter.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ObserveChatsRouter: ObserveChatsRouterProtocol {
    weak var viewController: ObserveChatsViewController!
    
    
    init(viewController: ObserveChatsViewController) {
        self.viewController = viewController
    }
    
    func showChat(_ user: User){
        //переход к чату
        let chatViewController = ChatViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.viewController.presenter.setUserName(user: user, chatViewController: chatViewController)
        self.viewController.navigationController?.pushViewController(chatViewController, animated: true)
        
        //chatViewController.navigationController?.pushViewController(chatViewController, animated: true)
        


        }
    }

