//
//  PaymentViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit

class PaymentViewController: UIViewController, PaymentViewProtocol {
    var presenter: PaymentPresenterProtocol!
    let configurator: PaymentConfiguratorProtocol = PaymentConfigurator()
    
    let ContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        //view.layer.cornerRadius = 5
        //view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let paymentMethodsBtn: UIButton={
        let button = UIButton()
        button.setTitle("Способы оплаты", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handlePaymentMet), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let paymentSettings: UIButton={
        let button = UIButton()
        button.setTitle("Настройки", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handlePaymentSet), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let paymentStatistics: UIButton={
        let button = UIButton()
        button.setTitle("Статистика платежей", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handlePaymentStat), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let firstfieldSeparator: UIView = {
        let fieldSeparator = UIView()
        fieldSeparator.backgroundColor = UIColor(r: 69, g: 69, b: 69, a: 1)
        fieldSeparator.translatesAutoresizingMaskIntoConstraints = false
        return fieldSeparator
    }()
    
    let secondfieldSeparator: UIView = {
        let fieldSeparator = UIView()
        fieldSeparator.backgroundColor = UIColor(r: 69, g: 69, b: 69, a: 1)
        fieldSeparator.translatesAutoresizingMaskIntoConstraints = false
        return fieldSeparator
    }()
    
    let thirdfieldSeparator: UIView = {
        let fieldSeparator = UIView()
        fieldSeparator.backgroundColor = UIColor(r: 69, g: 69, b: 69, a: 1)
        fieldSeparator.translatesAutoresizingMaskIntoConstraints = false
        return fieldSeparator
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        
        self.navigationItem.title = "Оплата"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        self.view.addSubview(ContainerView)
        self.view.addSubview(paymentMethodsBtn)
        self.view.addSubview(paymentSettings)
        self.view.addSubview(paymentStatistics)
        setupComponents()
     
    }

    func setupComponents(){
        ContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        ContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        ContainerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        ContainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        ContainerView.heightAnchor.constraint(equalToConstant: self.view.bounds.height).isActive = true
        
        ContainerView.addSubview(firstfieldSeparator)
        ContainerView.addSubview(secondfieldSeparator)
        ContainerView.addSubview(thirdfieldSeparator)
        
        paymentMethodsBtn.topAnchor.constraint(equalTo: ContainerView.topAnchor, constant: 3).isActive = true
        paymentMethodsBtn.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        paymentMethodsBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        paymentSettings.topAnchor.constraint(equalTo: paymentMethodsBtn.bottomAnchor, constant: 3).isActive = true
        paymentSettings.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        paymentSettings.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        paymentStatistics.topAnchor.constraint(equalTo: paymentSettings.bottomAnchor, constant: 3).isActive = true
        paymentStatistics.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        paymentStatistics.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        firstfieldSeparator.topAnchor.constraint(equalTo: paymentMethodsBtn.bottomAnchor).isActive = true
        firstfieldSeparator.leftAnchor.constraint(equalTo: ContainerView.leftAnchor).isActive = true
        firstfieldSeparator.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        firstfieldSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        secondfieldSeparator.topAnchor.constraint(equalTo: paymentSettings.bottomAnchor).isActive = true
        secondfieldSeparator.leftAnchor.constraint(equalTo: ContainerView.leftAnchor).isActive = true
        secondfieldSeparator.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        secondfieldSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        thirdfieldSeparator.topAnchor.constraint(equalTo: paymentStatistics.bottomAnchor).isActive = true
        thirdfieldSeparator.leftAnchor.constraint(equalTo: ContainerView.leftAnchor).isActive = true
        thirdfieldSeparator.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        thirdfieldSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true

                
        
    }
    func setView() {
        

    }
    
    @objc
    func handlePaymentMet() {
        presenter.methods()
    }
    
    @objc
    func handlePaymentSet() {
        presenter.settings()
    }
    
    @objc
    func handlePaymentStat() {
        presenter.statistics()
    }

}


