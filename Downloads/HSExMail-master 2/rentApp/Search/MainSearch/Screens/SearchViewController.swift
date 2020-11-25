//
//  SearchViewController.swift
//  TestAirbnb
//
//  Created by Тагир Ракипов on 01.11.2020.
//

import UIKit

class SearchViewController: UIViewController {
    
    var aparts: [ApartmentModel] = []
    var tableView = UITableView()
    
    struct Cells {
        static let apartCell = "ApartCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        aparts = fetchApartments()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(ApartTableViewCell.self, forCellReuseIdentifier: Cells.apartCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aparts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.apartCell, for: indexPath) as! ApartTableViewCell
        let apart = aparts[indexPath.row]
        cell.set(apartment: apart)
        
        return cell
    }
}
