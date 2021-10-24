//
//  UserService.swift
//  Instagram
//
//  Created by Media Davarkhah on 7/4/1400 AP.
//

import Firebase
struct UserService {
    static func fetchUser(completion: @escaping(User) -> Void) {
        //fetch current user by its uid
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
    
}
