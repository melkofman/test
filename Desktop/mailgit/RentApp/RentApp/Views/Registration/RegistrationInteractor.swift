//
//  RegistrationInteractor.swift
//  RentApp
//
//  Created by Melanie Kofman on 05.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegistrationInteractor: RegistrationInteractorProtocol {
weak var presenter: RegistrationPresenterProtocol!

required init(presenter: RegistrationPresenterProtocol) {
    self.presenter = presenter
}
    
    func regAction(email: String, password: String, phone: String, age: String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                print(error)
                return
            }

            
            let reference = FirebaseDatabase.Database.database().reference(fromURL: "https://rentapp-fd8c6-default-rtdb.firebaseio.com/")
            let userReference = reference.child("user").childByAutoId()
            
            let values = ["email": email, "password": password,"phone number":phone, "age": age]
            userReference.updateChildValues(values, withCompletionBlock:  {(error, reference) in
                if error != nil {
                    print(error)
                    return
                    
                }
                self.presenter.openApp()
                
            })
            
        }
    }
}
