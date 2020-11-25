//
//  NewMessageController.swift
//  chatt
//
//  Created by Melanie Kofman on 05.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit
class NewMessageController: UITableViewController{
    let cellId = "Cell"
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addUser(name: "Helper", image: #imageLiteral(resourceName: "helper"), id: 1)
        addUser(name: "Петр", image: #imageLiteral(resourceName: "turtleicon"), id: 0)
        addUser(name: "Александр", image: #imageLiteral(resourceName: "rickicon"), id: 0)
        addUser(name: "Сергей", image: #imageLiteral(resourceName: "buzzicon"), id: 0)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(self.handleBack))
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
    }
    
    func addUser(name: String, image: UIImage, id: Int){
        let newUser = User(name: name, image: image, id: id)
        
        users.append(newUser)
    }
    
    func addUser(name: String){
        let newUser = User(name: name)
        
        users.append(newUser)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId)
        
        let user = users[indexPath.row]
        cell?.textLabel?.text = user.name

        return cell!
    }
    @objc func handleBack(){
        dismiss(animated: true, completion: nil)
    }
}


class UserCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
}
