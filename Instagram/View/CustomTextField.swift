//
//  CustomTextField.swift
//  InstagramFirestoeTutorial
//
//  Created by Media Davarkhah on 4/22/1400 AP.
//

import UIKit
class CustomTextField: UITextField {
    
    
    // MARK: -LifeCycle
     init(placeholder: String) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
        
        borderStyle = .none
        setHeight(50)
        
        textColor = .white
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        textColor = UIColor(white: 0, alpha: 0.7)
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
