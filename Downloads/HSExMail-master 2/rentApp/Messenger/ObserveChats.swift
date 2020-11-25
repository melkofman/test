//
//  ObserveChats.swift
//  chatt
//
//  Created by Melanie Kofman on 05.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit
class ObserveChats: UITableViewController{
    
    
    var users = [User]()
    let cellId = "Cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(self.handleBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Написать", style: .plain, target: self, action: #selector(self.handleNewMessage))
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        addUser(name: "Helper", image: #imageLiteral(resourceName: "helper"), id: 1)
        addUser(name: "Петр", image: #imageLiteral(resourceName: "turtleicon"), id: 0)
        addUser(name: "Александр", image: #imageLiteral(resourceName: "rickicon"), id: 0)
        addUser(name: "Сергей", image: #imageLiteral(resourceName: "buzzicon"), id: 0)

        
    }
    func addUser(name: String, image: UIImage, id: Int){
        let newUser = User(name: name, image: image, id: id)
        
        users.append(newUser)
    }
    func addUser(name: String){
        let newUser = User(name: name)
        
        users.append(newUser)
    }
    func addUser(name: String, id: Int){
        let newUser = User(name: name, id: id)
        
        users.append(newUser)
    }
    func observeMessages(_ user: User){
        
        let chatViewController = ChatViewController(collectionViewLayout: UICollectionViewFlowLayout())
        chatViewController.changeName(user: user)
            
        navigationController?.pushViewController(chatViewController, animated: true)

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
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.observeMessages(self.users[indexPath.row])
    }
    

    @objc func handleNewMessage(){
        let newMessage = NewMessageController()
        let navigationController = UINavigationController(rootViewController: newMessage)
        present(navigationController, animated: true, completion: nil)
    }
    //    @objc func handleBack(){
    //        print("назад")
    //        //САВВА, СЮДА ВСТАВИТЬ КОД ДЛЯ ЩЕЛЧКА НАЗАД
    //    }
}
