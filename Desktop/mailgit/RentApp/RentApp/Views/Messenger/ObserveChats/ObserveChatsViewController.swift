//
//  ObserveChatsViewController.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ObserveChatsViewController: UITableViewController, ObserveChatsViewProtocol {
    var presenter: ObserveChatsPresenterProtocol!
    let configurator: ObserveChatsConfiguratorProtocol = ObserveChatsConfigurator()
    
    var users = [User]()
    let cellId = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        self.navigationItem.title = "Inbox"
        //временно
        addUser(name: "Helper", image: #imageLiteral(resourceName: "helper"), id: 1)
        addUser(name: "Петр", image: #imageLiteral(resourceName: "turtleicon"), id: 0)
        addUser(name: "Александр", image: #imageLiteral(resourceName: "rickicon"), id: 0)
        addUser(name: "Сергей", image: #imageLiteral(resourceName: "buzzicon"), id: 0)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //self.observeMessages(self.users[indexPath.row])
        presenter.chatClicked(user: self.users[indexPath.row])
    }
    
    func addUser(name: String, image: UIImage, id: Int){
           let newUser = User(name: name, image: image, id: id)
           users.append(newUser)
       }
    
    func setView() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return users.count
       }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId)
     
           let user = users[indexPath.row]
           let image = users[indexPath.row].profileImage
    
           cell?.imageView?.image = image
           cell?.textLabel?.text = user.name
           cell?.detailTextLabel?.text = "Сообщение"
           cell?.backgroundColor = UIColor(r: 123, g: 104, b: 238, a: 0.2)
           
           return cell!
       }
}

