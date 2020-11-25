//
//  ApartViewController.swift
//  TestAirbnb
//
//  Created by Тагир Ракипов on 02.11.2020.
//

import UIKit

class ApartViewController: UIViewController {
    var city: String?
    var address: String?
    
    var cityLabel: UILabel!
    var addressLabel: UILabel!

    override func viewDidLoad(){
        super.viewDidLoad()
        
        createTextLabel(label: self.cityLabel, name: "City", value: self.city)
        createTextLabel(label: self.cityLabel, name: "Address", value: self.address)
        
        updateLabel(label: cityLabel)
        updateLabel(label: addressLabel)
    }
    
    func createTextLabel(label: UILabel, name: String, value: String?){
        let label = UILabel()
        label.text = "\(name): \(value ?? "unknown")"
        label.textAlignment = .center
        self.view.addSubview(label)
    }
    
    func updateLabel(label: UILabel){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        label.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
}
