//
//  ChatViewController.swift
//  chatt
//
//  Created by Melanie Kofman on 26.11.2020.
//  Copyright © 2020 Melanie Kofman. All rights reserved.
//

import UIKit

class ChatViewController: UICollectionViewController, ChatViewProtocol, UITextFieldDelegate, UICollectionViewDelegateFlowLayout {
    var presenter: ChatPresenterProtocol!
    let configurator: ChatConfiguratorProtocol = ChatConfigurator()
    
    lazy var inputMessageField: UITextField = {
           let messageField = UITextField()
           messageField.placeholder = "Введите сообщение..."
           messageField.translatesAutoresizingMaskIntoConstraints = false
           messageField.delegate = self
           return messageField
       }()
    
    let cellId = "cellId"
    var name = "Чат с поддержкой"
    var messages = [Message]()
    var newmessage = String()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
        
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 58, right: 0)
        collectionView?.alwaysBounceVertical = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(handleBack))
        
        setUserName(name: name)
        
        collectionView?.backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
        
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
        
        helperOrNot() //показывает надо ли писать сообщение от помощника
        
        DispatchQueue.main.async{
            self.collectionView?.reloadData()
        }
        setupInputComponents()
    }
    func helperOrNot() {
        presenter.decideHelperOrNot(name: name, chatViewController: self)
    }
    
    @objc func handleBack() {
        presenter.handleBack()
    }
    
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

    func setView() {
    }
    
    private func setupInputComponents() {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containerView)
        
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: (0-((tabBarController?.tabBar.bounds.height)!))).isActive = true
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
        presenter.sendMessage(newmessage: newmessage, chatViewController: self)
        DispatchQueue.main.async{
                       self.collectionView?.reloadData()
                   }
        self.inputMessageField.text = nil
    }
    
    
    private func setUserName(name: String) {
        self.navigationItem.title = name
    }
    
    private func measureFrameForText(_ text: String) -> CGRect{
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], context: nil)
        
    }
    
    private func decideCellColor(_ cell: MessageCell, message: Message){
        if presenter.decideColor(from: message.from!){
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
    
    
}
