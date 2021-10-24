//
//  AuthenticationViewModel.swift
//  InstagramFirestoeTutorial
//
//  Created by Media Davarkhah on 6/18/1400 AP.
//

import UIKit
protocol FormViewModel {
    func updateForm()
}

protocol AuthenticationViewModel{
    var isFormValid: Bool {get}
    var buttonBackgroundColor: UIColor {get}
    var titleBackgroundColor: UIColor {get}
}
struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var isFormValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return isFormValid ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.2)
    }
    
    var titleBackgroundColor: UIColor {
        return isFormValid ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.67)
    }

}

struct RegisterationViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    var fullName: String?
    var username: String?
    
    var isFormValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && username?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return isFormValid ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.2)
    }
    
    var titleBackgroundColor: UIColor {
        return isFormValid ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.67)
    }

}
