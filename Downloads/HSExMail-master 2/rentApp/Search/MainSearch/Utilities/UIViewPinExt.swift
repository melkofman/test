//
//  UIViewPinExt.swift
//  TestAirbnb
//
//  Created by Тагир Ракипов on 10.11.2020.
//

import UIKit

extension UIView{
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints =                             false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive =           true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive =   true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive =     true
    }
}
