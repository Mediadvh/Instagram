//
//  AuthService.swift
//  Instagram
//
//  Created by Media Davarkhah on 6/24/1400 AP.
//
//
import UIKit
import Firebase
import FirebaseStorage

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let userName: String
    let profileImage: UIImage
}

struct AuthService {
    
    static func loginUser(withEmail email:String, withPassword password: String, completionHandler: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completionHandler)
    }
    
    
    
    
    
    
    
    
    static func registerUser(withCredentials credentials: AuthCredentials, completionHandler: @escaping (Error?) -> Void) {
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { result, error in
                
                if let error = error {
                    print("DEBUG: Couldn't Register User: \(error.localizedDescription)")
                    completionHandler(error)
                    return
                }
                if let result = result {
                    let uuid = result.user.uid
                    let data: [String : Any] = ["email": credentials.email, "password" : credentials.password, "fullName": credentials.password, "uuid" : uuid,"username" : credentials.userName, "profileImage" : imageUrl]
                    
                   COLLECTION_USERS.document(uuid).setData(data, completion: completionHandler)
                
                }
                
            }
            
        }
    }
}
