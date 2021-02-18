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
    func errorAlert(error: ErrorType)
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
            self.view.errorAlert(error: .emptyName)
        }else if surname == ""  {
            self.view.errorAlert(error: .emptyLastname)
        }else if email == ""  {
            self.view.errorAlert(error: .emptyEmail)
        }else if password == ""  {
            self.view.errorAlert(error: .emptyPassword)
        }else if !passwd.evaluate(with: password){
            self.view.errorAlert(error: .incorrectPassword)
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
                self.view.errorAlert(error: .creatinUser)
            }else{

                let db = Firestore.firestore()
                db.collection("users").addDocument(data: [
                    "firstname": name,
                    "lastname": surname,
                    "email": email,
                    "uid": authResult!.user.uid
                ]) { err in
                    if err != nil {
                        self.view.errorAlert(error: .savingData)
                    }
                }
                self.view.signUpSuccess()
            }

        }
    
    }
    
    
}
