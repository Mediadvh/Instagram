//
//  ProfileHeaderViewModel.swift
//  Instagram
//
//  Created by Media Davarkhah on 7/6/1400 AP.
//

import Foundation
struct ProfileHeaderViewModel {
    let user: User
    
    var fullname: String {
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        guard let url = URL(string: user.profileImageUrl) else { return nil }
        return url
        
    }
    
    init(user: User) {
        self.user = user
    }
}
