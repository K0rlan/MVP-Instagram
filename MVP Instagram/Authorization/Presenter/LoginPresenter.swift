//
//  LoginPresenter.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 18.02.2021.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol LoginProtocol {
    func errorAlert(error: String)
    func loginSuccess()
    func startSpinner()
}

protocol LoginPresenterProtocol {
    init(view: LoginProtocol)
    func getAuthData(email: String?, password: String?)
    func login(email: String, password: String)
}

class LoginPresenter: LoginPresenterProtocol {
    
    let view: LoginProtocol
    
    required init(view: LoginProtocol) {
        self.view = view
    }
    
    func getAuthData(email: String?, password: String?) {
        let passwd = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&].{8,}")
        if email == ""  {
            self.view.errorAlert(error: "Email is empty")
        }else if password == ""  {
            self.view.errorAlert(error: "Password is empty")
        }else if !passwd.evaluate(with: password){
            self.view.errorAlert(error: "Password must include uppercase and lowercase letters, numbers and symbols, also it must be more than 8 characters long.")
        }else{
            guard let email = email else { return }
            guard let password = password else { return }
            login(email: email, password: password)
        }
    }
    
    func login(email: String, password: String) {
        self.view.startSpinner()
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if error != nil{
                strongSelf.view.errorAlert(error: error!.localizedDescription)
            }else{
                strongSelf.view.loginSuccess()
            }
        }
    }
    
    
}
