//
//  RegisterationController.swift
//  InstagramFirestoeTutorial
//
//  Created by Media Davarkhah on 4/20/1400 AP.
//

import UIKit
import Firebase
class ResgisterationController: UIViewController {
    // MARK: -Properties
    
    var viewModel = RegisterationViewModel()
    private var profileImage: UIImage?
    private var addImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(didTapaddImageButton), for: .touchUpInside)
        return button
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
    
    private let fullNameTextField = CustomTextField(placeholder: "FullName")
    
    private let userNameTextField = CustomTextField(placeholder: "UserName")
    
    private let signUpButton: AuthenticationButton = {
        let button = AuthenticationButton(title: "Sign Up")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var HaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Login")
        button.addTarget(self, action: #selector(showLoginController), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotifactionObservers()
       
    }
    
  
    // MARK: -Helpers

    func configureUI() {
        
        configureGardient()
        
        view.addSubview(addImageButton)
        addImageButton.centerX(inView: view)
        addImageButton.setDimensions(height: 140, width: 140)
        addImageButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,fullNameTextField,userNameTextField, signUpButton])
        
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.centerX(inView: view)
        stack.anchor(top: addImageButton.bottomAnchor, left: view.leftAnchor , right: view.rightAnchor, paddingTop: 10,paddingLeft: 32 , paddingRight: 32)
        
        view.addSubview(HaveAccountButton)
        HaveAccountButton.centerX(inView: view)
        HaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor , paddingBottom: 10)
        
        

    }
    
    func configureNotifactionObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        } else if sender == fullNameTextField {
            viewModel.fullName = sender.text
        } else {
            viewModel.username = sender.text
        }
        updateForm()
        
    }
    // MARK: -Actions
    @objc func showLoginController(){
        navigationController?.popViewController(animated: true)
    }
    @objc func didTapaddImageButton() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true)
    }
    
    @objc func handleSignUp() {
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        guard let userName = userNameTextField.text?.lowercased() else { return }
        guard let profileImage = profileImage else { return }
        
        let credentials = AuthCredentials(email: email, password: password, fullName: fullName, userName: userName, profileImage: profileImage)
        
        AuthService.registerUser(withCredentials: credentials) { error in
            if let error = error {
                print("DEBUG: Couldn't Register User: \(error.localizedDescription)")
                return
            }
            
            self.dismiss(animated: true)
        }
    }
}
extension ResgisterationController: FormViewModel, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //MARK: -FormViewModel
    func updateForm() {
        
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.titleBackgroundColor, for: .normal)
        signUpButton.isEnabled = viewModel.isFormValid
        
    }
    
    //MARK: -UIImagePickerController
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        guard let selectedPhoto = info[.editedImage] as? UIImage else { return }
        
        addImageButton.layer.cornerRadius = addImageButton.frame.width / 2
        addImageButton.layer.masksToBounds = true
        addImageButton.layer.borderWidth = 2
        addImageButton.layer.borderColor = UIColor.white.cgColor
        addImageButton.setImage(selectedPhoto.withRenderingMode(.alwaysOriginal), for: .normal)
        profileImage = selectedPhoto
        dismiss(animated: true)
    }
    
}


