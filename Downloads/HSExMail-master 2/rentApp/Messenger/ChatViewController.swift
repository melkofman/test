//
//  ChatViewController.swift
//  chatt
//  Created by Melanie Kofman on 27.10.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ChatViewController: UICollectionViewController, UITextFieldDelegate, UICollectionViewDelegateFlowLayout {
    
    
    lazy var inputMessageField: UITextField = {
        let messageField = UITextField()
        messageField.placeholder = "Введите сообщение..."
        messageField.translatesAutoresizingMaskIntoConstraints = false
        messageField.delegate = self
        return messageField
    }()
    
    
    let cellId = "cellId"
    private var name = "Чат с поддержкой"
    private let texthelper = "Напишите нам, если у Вас возникли проблемы. Наши операторы свяжутся с Вами для помощи."
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 58, right: 0)
        collectionView?.alwaysBounceVertical = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(self.handleBack))
        setUserName(name: name)
        
        collectionView?.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
        
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
        
        
        if (fromWho().caseInsensitiveCompare("Чат с поддержкой")) == .orderedSame{
        let message = Message(text: texthelper, from: "helper")
            messages.append(message)
            
        }
        DispatchQueue.main.async{
            self.collectionView?.reloadData()
        }

        setupInputComponents()
        

        
    }
    
    func fromWho() -> String {
        return self.name
    }

    func changeName(user: User){
        switch user.id {
        case 1:
            self.name = "Чат с поддержкой"
        default:
            self.name = user.name!
        }
        
    }
    
    var messages = [Message]()
    var newmessage = String()
    
    //количество ячеек
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
        
    }
    
    //для ячеек
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessageCell
    
        let message = messages[indexPath.item]
        cell.textView.text = message.text
        
        cell.bubbleViewWidthAnchor?.constant = measureFrameForText(message.text!).width + 30
        decideCellColor(cell, message: message)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = 80
        
        if let text = messages[indexPath.row].text {
            height = measureFrameForText(text).height + 20
        }
        
        
        return CGSize(width: view.frame.width, height: height)
    }
    
  
    func setupInputComponents() {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Отправить", for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        containerView.addSubview(sendButton)
        
        sendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true

        containerView.addSubview(inputMessageField)
        
        inputMessageField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        inputMessageField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        inputMessageField.rightAnchor.constraint(equalTo: sendButton.leftAnchor).isActive = true
        inputMessageField.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
    }
    
    @objc func sendMessage() {
        newmessage = inputMessageField.text!
        if !newmessage.isEmpty{
            let message = Message(text: newmessage, from: "user")
            messages.append(message)
            
            DispatchQueue.main.async{
                self.collectionView?.reloadData()
            }
        }
        
        self.inputMessageField.text = nil
        
    }
    
    @objc func handleBack(){

        navigationController?.popToRootViewController(animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendMessage()
        return true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func setUserName(name: String) {
        self.navigationItem.title = name
    }
    
    private func decideCellColor(_ cell: MessageCell, message: Message){
        if ((message.from?.caseInsensitiveCompare("user")) == .orderedSame){
            cell.bubbleView.backgroundColor = MessageCell.colorUser
            cell.helperImageView.isHidden = true
            cell.bubbleViewRightAncor?.isActive = true
            cell.bubbleViewLeftAncor?.isActive = false
        }
        else {
            cell.bubbleView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
            cell.helperImageView.isHidden = false
            cell.bubbleViewRightAncor?.isActive = false
            cell.bubbleViewLeftAncor?.isActive = true
        }
    }
    
    private func measureFrameForText(_ text: String) -> CGRect{
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], context: nil)
        
    }
}
