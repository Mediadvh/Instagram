//
//  LoginController.swift
//  InstagramFirestoeTutorial
//
//  Created by Media Davarkhah on 4/20/1400 AP.
//

import UIKit
import Firebase

protocol AuthenticationDelegate:class {
    func AuthenticationDidComplete()
}
class LoginController: UIViewController {
    
    // MARK:-Properties
    
    var viewModel = LoginViewModel()
    weak var delegate: AuthenticationDelegate?
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Email")
        textField.keyboardType = .emailAddress
        return textField
        
    }()
    
    private let passwordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true
        return textField
        
    }()
    private let LoginButton:AuthenticationButton = {
        let button = AuthenticationButton(title: "Login")
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
        
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Forgot your password?", secondPart: "Get help signing in")
        return button

    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Don't have an Account?" , secondPart: "Sign Up")
        button.addTarget(self, action: #selector(showSignUpController), for: .touchUpInside)
        return button

    }()
    
    // MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNotifactionObservers()
       
    }
  
    
    // MARK: -Helpers
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        // TODO: change the style
        
        // set the gardient color
        configureGardient()
     
        
        view.addSubview(iconImageView)
        iconImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor ,paddingTop: 10)
        iconImageView.centerX(inView: view)
        

        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, LoginButton,forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        
        stackView.anchor(top: iconImageView.bottomAnchor
                              ,left: view.leftAnchor
                              ,right: view.rightAnchor
                              ,paddingTop: 32
                              ,paddingLeft: 32
                              ,paddingRight: 32)
        
        view.addSubview(signUpButton)
        signUpButton.centerX(inView: view)
        signUpButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10)
        
    }
    
    func configureNotifactionObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
    }
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        
        updateForm()
        
    }
    // MARK: -Actions
    @objc func showSignUpController() {
        let controller = ResgisterationController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        AuthService.loginUser(withEmail: email, withPassword: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to log user in \(error.localizedDescription)")
                return
            }
            self.delegate?.AuthenticationDidComplete()
            
        }
    }
}


extension LoginController: FormViewModel {
    func updateForm() {
        
        LoginButton.backgroundColor = viewModel.buttonBackgroundColor
        LoginButton.setTitleColor(viewModel.titleBackgroundColor, for: .normal)
        LoginButton.isEnabled = viewModel.isFormValid
        
    }
    
}
