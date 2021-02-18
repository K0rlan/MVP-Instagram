//
//  SignUpViewController.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 18.02.2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    //MARK: - UI Elements -
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ConstantsForAuth.logo
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Имя"
        textField.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = ConstantsForAuth.gray
        textField.layer.cornerRadius = 8
        textField.backgroundColor = ConstantsForAuth.textFieldbackgroundColor
        return textField
    }()
    
    lazy var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Фамилия"
        textField.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = ConstantsForAuth.gray
        textField.layer.cornerRadius = 8
        textField.backgroundColor = ConstantsForAuth.textFieldbackgroundColor
        return textField
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Эл.адрес"
        textField.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.borderColor = ConstantsForAuth.gray
        textField.layer.cornerRadius = 8
        textField.backgroundColor = ConstantsForAuth.textFieldbackgroundColor
        return textField
    }()
    
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.font = .systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = ConstantsForAuth.gray
        textField.backgroundColor = ConstantsForAuth.textFieldbackgroundColor
        textField.isSecureTextEntry = true
        
        let btnPassword = UIButton(frame: CGRect(x: 12.5, y: 12.5, width: 25, height: 25))
        let informationImage = ConstantsForAuth.invisible
        btnPassword.setImage(informationImage, for: .normal)
        btnPassword.contentMode = .scaleAspectFit
        btnPassword.addTarget(self, action: #selector(passwordButtonPressed), for: .touchUpInside)
        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
        separatorView.addSubview(btnPassword)
        textField.rightViewMode = .always
        textField.rightView = separatorView
        
        return textField
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = ConstantsForAuth.buttonBackgroundColor
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        return button
    }()
    
    
    //MARK: - Separators Views -
    
    lazy var firstSeparatorView: SeparatorViews = {
        let view = SeparatorViews()
        return view
    }()
    
    lazy var secondSeparatorView: SeparatorViews = {
        let view = SeparatorViews()
        return view
    }()
    
    lazy var thirdSeparatorView: SeparatorViews = {
        let view = SeparatorViews()
        return view
    }()
    
    var iconClick = true
    var presenter: SignUpPresenterProtocol!
    let child = SpinnerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = .white
        presenter = SignUpPresenter.init(view: self)
        setupViews()
    }
    
    private func setupViews() {
        [logoImageView, nameTextField, surnameTextField, loginTextField, passwordTextField, enterButton, firstSeparatorView, secondSeparatorView, thirdSeparatorView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        firstSeparatorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        firstSeparatorView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        logoImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: firstSeparatorView.bottomAnchor).isActive = true
        
        secondSeparatorView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor).isActive = true
        secondSeparatorView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.04).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: secondSeparatorView.bottomAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        surnameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        surnameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        surnameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginTextField.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 10).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        loginTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        thirdSeparatorView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        thirdSeparatorView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.025).isActive = true
        
        enterButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25).isActive = true
        enterButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        enterButton.topAnchor.constraint(equalTo: thirdSeparatorView.bottomAnchor).isActive = true
        
    }
    
    //MARK: - Actions -
    
    @objc func passwordButtonPressed(sender: UIButton){
        let passwordHideImage = ConstantsForAuth.invisible
        let passwordVisibleImage = ConstantsForAuth.eye
        
        iconClick = !iconClick
        if iconClick == false {
            passwordTextField.isSecureTextEntry = false
            sender.setImage(passwordVisibleImage, for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            sender.setImage(passwordHideImage, for: .normal)
        }
    }
    @objc func enterButtonPressed(sender: UIButton){
        presenter.getAuthData(name: nameTextField.text, surname: surnameTextField.text, email: loginTextField.text, password:passwordTextField.text)
    }
    
}
extension SignUpViewController: SignUpProtocol{
    func startSpinner() {
        addChild(child)
        child.view.frame = self.view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    func errorAlert(error: String) {
        
        let alertViewController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
    
    func signUpSuccess() {
        let home = TabBar()
        self.view.window?.rootViewController = home
        self.view.window?.makeKeyAndVisible()
    }
}
