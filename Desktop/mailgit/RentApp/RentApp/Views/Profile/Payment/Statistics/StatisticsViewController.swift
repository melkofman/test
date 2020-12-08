//
//  StatisticsViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 07.12.2020.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    let ContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        //view.layer.cornerRadius = 5
        //view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   let statTitle: UILabel = {
        let title = UILabel()
        title.text = "Ваша статистика платежей"
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor(r: 20, g: 3, b: 22, a: 1)
        title.font = UIFont.boldSystemFont(ofSize: 24)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override func viewDidLoad() {
           super.viewDidLoad()
           self.view.addSubview(ContainerView)
        self.view.addSubview(statTitle)
           setView()
         
        
        self.view.backgroundColor = .green

          
        
       }
    func setView() {
        ContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        ContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        ContainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        ContainerView.heightAnchor.constraint(equalToConstant: self.view.bounds.height).isActive = true
        
        statTitle.topAnchor.constraint(equalTo: ContainerView.topAnchor, constant: 10).isActive = true
        statTitle.widthAnchor.constraint(equalTo: ContainerView.widthAnchor).isActive = true
        statTitle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
}

