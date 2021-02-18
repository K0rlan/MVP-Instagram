//
//  SignUpPresenter.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 18.02.2021.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol SignUpProtocol {
    func errorAlert(error: String)
    func signUpSuccess()
    func startSpinner()
}

protocol SignUpPresenterProtocol {
    init(view: SignUpProtocol)
    func getAuthData(name: String?, surname: String?, email: String?, password: String?)
    func signUp(name: String, surname: String, email: String, password: String)
}

class SignUpPresenter: SignUpPresenterProtocol {
    
    let view: SignUpProtocol
    
    required init(view: SignUpProtocol) {
        self.view = view
    }
    
    func getAuthData(name: String?, surname: String?, email: String?, password: String?) {
        let passwd = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&].{8,}")
        if name == ""  {
            self.view.errorAlert(error: "First name is empty")
        }else if surname == ""  {
            self.view.errorAlert(error: "Last name is empty")
        }else if email == ""  {
            self.view.errorAlert(error: "Email is empty")
        }else if password == ""  {
            self.view.errorAlert(error: "Password is empty")
        }else if !passwd.evaluate(with: password){
            self.view.errorAlert(error: "Password must include uppercase and lowercase letters, numbers and symbols, also it must be more than 8 characters long.")
        }else{
            guard let email = email else { return }
            guard let password = password else { return }
            guard let name = name else { return }
            guard let surname = surname else { return }
            signUp(name: name, surname: surname, email: email, password: password)
        }
    }
    
    func signUp(name: String, surname: String, email: String, password: String) {
        self.view.startSpinner()
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, err) in
            if err != nil {
                self.view.errorAlert(error: "Error creating user")
            }else{

                let db = Firestore.firestore()
                db.collection("users").addDocument(data: [
                    "firstname": name,
                    "lastname": surname,
                    "email": email,
                    "uid": authResult!.user.uid
                ]) { err in
                    if err != nil {
                        self.view.errorAlert(error: "Error saving user data")
                    }
                }
                self.view.signUpSuccess()
            }

        }
    
    }
    
    
}
