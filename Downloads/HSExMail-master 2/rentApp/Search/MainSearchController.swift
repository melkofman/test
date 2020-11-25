//
//  MainSearchController.swift
//  rentApp
//
//  Created by Савва Шулятьев on 10.11.2020.
//

import UIKit
import MapKit

class MainSearchController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        setupSearchBar()
        
        let mapView = MKMapView()
        let tableInfo = UITableView()
        
        let leftMargin:CGFloat = 0
        let topMargin:CGFloat = 0
        let mapWidth:CGFloat = view.frame.size.width-0
        let mapHeight:CGFloat = 800
                
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        tableInfo.frame = CGRect(x: leftMargin, y: 300, width: 0, height: 600)
                
            mapView.mapType = MKMapType.standard
            mapView.isZoomEnabled = true
            mapView.isScrollEnabled = true
        
        view.addSubview(mapView)
        view.addSubview(tableInfo)
        
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

}


