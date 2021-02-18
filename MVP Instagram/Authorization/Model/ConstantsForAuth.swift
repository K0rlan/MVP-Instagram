//
//  ConstantsForAuth.swift
//  MVP Instagram
//
//  Created by Korlan Omarova on 18.02.2021.
//

import UIKit

struct ConstantsForAuth {
    static let close = UIImage(named: "close")
    static let logo = UIImage(named: "logo")
    static let invisible = UIImage(named: "invisible")
    static let eye = UIImage(named: "eye")
    
    static let gray = CGColor(red: 220/255, green: 220/255, blue: 222/255, alpha: 1)
    static let textFieldbackgroundColor = UIColor(cgColor: CGColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1))
    static let buttonTitleColor = UIColor(cgColor: CGColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1))
    static let buttonBackgroundColor = UIColor(cgColor: CGColor(red: 142/255, green: 200/255, blue: 245/205, alpha: 1))   
}

enum ErrorType: String{
    case creatinUser = "Error creating user"
    case savingData = "Error saving user data"
    case emptyName = "First name is empty"
    case emptyLastname = "Last name is empty"
    case emptyEmail = "Email is empty"
    case emptyPassword = "Password is empty"
    case incorrectPassword = "Password must include uppercase and lowercase letters, numbers and symbols, also it must be more than 8 characters long."
    case serverError = "Server error"
    
}
