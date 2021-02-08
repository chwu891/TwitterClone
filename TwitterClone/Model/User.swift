//
//  User.swift
//  TwitterClone
//
//  Created by chihsien  on 2021/2/8.
//

import Foundation

struct User: Identifiable {
    let email: String
    let fullname: String
    let profileImageUrl: String
    let id: String
    let username: String
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname  = dictionary["fullname"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
    }
}
