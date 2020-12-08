//
//  MethodsViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit

class MethodsViewController: UIViewController {
    
    let ContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        //view.layer.cornerRadius = 5
        //view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cashPaymentBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 239, g: 71, b: 111, a: 1)
        button.setTitle("Оплата наличными", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector (cashHandle), for: .touchDown)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cardPaymentBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 255, g: 209, b: 102, a: 1)
        button.setTitle("Оплата картой", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(cardHandle), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let certPaymentBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 17, g: 138, b: 178, a: 1)
        button.setTitle("Оплатить подарочным сертификатом", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(cardHandle), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
  
    
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
        self.view.addSubview(ContainerView)
        self.view.addSubview(cashPaymentBtn)
        self.view.addSubview(cardPaymentBtn)
        self.view.addSubview(certPaymentBtn)
        setView()
           self.navigationItem.title = "Методы оплаты"
           self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.backgroundColor = .white
        
        

        
}
    
    func setView() {
        ContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        ContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        ContainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        ContainerView.heightAnchor.constraint(equalToConstant: self.view.bounds.height).isActive = true
        
        cashPaymentBtn.topAnchor.constraint(equalTo: ContainerView.topAnchor, constant: 58).isActive = true
        cashPaymentBtn.widthAnchor.constraint(equalTo: ContainerView.widthAnchor, constant: 8).isActive = true
        cashPaymentBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cardPaymentBtn.topAnchor.constraint(equalTo: cashPaymentBtn.topAnchor, constant: 58).isActive = true
        cardPaymentBtn.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        cardPaymentBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        certPaymentBtn.topAnchor.constraint(equalTo: cardPaymentBtn.topAnchor, constant: 58).isActive = true
        certPaymentBtn.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        certPaymentBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    @objc func cashHandle(){
        print("")
    }
    @objc func cardHandle() {
        print("")
    }
}
