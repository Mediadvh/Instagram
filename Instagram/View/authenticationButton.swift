//
//  authenticationButton.swift
//  InstagramFirestoeTutorial
//
//  Created by Media Davarkhah on 4/22/1400 AP.
//

import UIKit
class AuthenticationButton: UIButton {
   
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setHeight(50)
        setWidth(50)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.2)
        tintColor = .white
        layer.cornerRadius = 5
        isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
