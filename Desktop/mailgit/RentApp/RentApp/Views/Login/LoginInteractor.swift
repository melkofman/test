//
//  LoginInteractor.swift
//  RentApp
//
//  Created by Melanie Kofman on 04.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LoginInteractor: LoginInteractorProtocol {
    weak var presenter: LoginPresenterProtocol!
    
    required init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
    }
    
   
    
    func loginAction(email: String, password: String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error.debugDescription)
                
                
                return
            }
            self.presenter.openApp()
        })
        
    }
    
    private func showAlert() {
        
    }
    
    
}
