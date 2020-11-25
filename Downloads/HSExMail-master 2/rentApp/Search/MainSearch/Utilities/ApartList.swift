//
//  ApartList.swift
//  TestAirbnb
//
//  Created by Тагир Ракипов on 10.11.2020.
//

import UIKit

func fetchApartments() -> [ApartmentModel] {
    let DC = "Moscow"
    let divider = "_"
    let suffix = "apart.jpg"
    
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    let items = try! fm.contentsOfDirectory(atPath: path)
    
    print(path)
    
    var res = [ApartmentModel]()
    for item in items {
        print(item)
        if item.hasSuffix(suffix){
            let dividerIndex = item.firstIndex(of: divider.first!)!
            let address = String(item[..<dividerIndex])
            let image = UIImage(named: item)
            let apart = ApartmentModel(city: DC, address: address, image: image)
            
            res.append(apart)
        }
    }
    
    return res
}
