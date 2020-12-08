//
//  LoginViewController.swift
//  RentApp
//
//  Created by Melanie Kofman on 04.12.2020.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, LoginViewProtocol {
    var presenter: LoginPresenterProtocol!
    let configurator: LoginConfiguratorProtocol = LoginConfigurator()
    
    private lazy var adapter = KeyboardAdapter() { [weak self] offset, duration in
        self?.keyboardOffsetChanged(offset, duration: duration)
    }
    
    let screenTitle: UITextView = {
        let title = UITextView()
        title.text = "Rent App"
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor(r: 20, g: 3, b: 22, a: 1)
        title.font = UIFont.boldSystemFont(ofSize: 70)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let loginContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 193, g: 191, b: 194, a: 0.7)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textfield.isSecureTextEntry = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor(r: 193, g: 191, b: 194, a: 0.8)
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let fieldSeparator: UIView = {
        let fieldSeparator = UIView()
        fieldSeparator.backgroundColor = UIColor(r: 69, g: 69, b: 69, a: 1)
        fieldSeparator.translatesAutoresizingMaskIntoConstraints = false
        return fieldSeparator
    }()
    
    let regTextField: UILabel = {
        let title = UILabel()
        title.text = "Нет аккаунта? Зарегестрируйтесь!"
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor(r: 20, g: 3, b: 22, a: 1)
        title.font = UIFont.boldSystemFont(ofSize: 12)
        title.backgroundColor = .clear
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let regButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Регистрация", for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(handleRegButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
    super.viewDidLoad()
    configurator.configure(with: self)
    presenter.configureView()
        
        
    self.view.addSubview(loginContainerView)
    self.view.addSubview(loginButton)
    self.view.addSubview(screenTitle)
    self.view.addSubview(regTextField)
    self.view.addSubview(regButton)
    setLoginComponents()
    setbackgroundImage()
    
    }
    
    func setLoginComponents(){
        
        loginContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loginContainerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -24).isActive = true
        loginContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        loginContainerView.addSubview(nameTextField)
        loginContainerView.addSubview(passwordTextField)
        loginContainerView.addSubview(fieldSeparator)
        
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: loginContainerView.bottomAnchor, constant: 12).isActive = true
        loginButton.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        screenTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        screenTitle.bottomAnchor.constraint(equalTo: loginContainerView.topAnchor).isActive = true
        screenTitle.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
        screenTitle.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: loginContainerView.topAnchor, constant: 8).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalTo: loginContainerView.heightAnchor, multiplier: 1/2).isActive = true
        
        passwordTextField.bottomAnchor.constraint(equalTo: loginContainerView.bottomAnchor, constant: 8).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: loginContainerView.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: loginContainerView.heightAnchor, multiplier: 1/2).isActive = true
        
        fieldSeparator.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        fieldSeparator.leftAnchor.constraint(equalTo: loginContainerView.leftAnchor).isActive = true
        fieldSeparator.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        fieldSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        regTextField.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        regTextField.leftAnchor.constraint(equalTo: loginButton.leftAnchor).isActive = true
        regTextField.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        regTextField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        regButton.topAnchor.constraint(equalTo: regTextField.bottomAnchor).isActive = true
        regButton.leftAnchor.constraint(equalTo: regTextField.leftAnchor).isActive = true
        regButton.widthAnchor.constraint(equalTo: regTextField.widthAnchor).isActive = true
        regButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    func setView(){
        
    }
    
    @objc
    func handleLoginButton() {
        guard let email = nameTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        presenter.login(email: email, password: password)
    }
    
    @objc
    func handleRegButton() {
        presenter.registration()
    }
    
    
    
    private func setbackgroundImage() {
        let background = UIImage(named: "bground.jpg")
        
        var imageView: UIImageView!
        imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
}

private extension LoginViewController {
func keyboardOffsetChanged(_ offset: CGFloat, duration: TimeInterval) {
    UIView.animate(withDuration: duration) {
        //self.loaginButtonBottomConstraint?.constant = -56 - offset
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
}
}
