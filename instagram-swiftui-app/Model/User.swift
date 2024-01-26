//
//  User.swift
//  instagram-swiftui-app
//
//  Created by loratech on 24/01/24.
//

import Foundation 


struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "jennie",profileImageUrl: "jennie",fullname: "Jennie Blackpink",bio: "I'm member of Blackpink", email: "jennie@blackpink.com"),
        .init(id: NSUUID().uuidString, username: "rose",profileImageUrl: "rose",fullname: "Jennie Blackpink",bio: "I'm member of Blackpink", email: "jennie@blackpink.com"),
        .init(id: NSUUID().uuidString, username: "lisa",profileImageUrl: "lisa",fullname: "Lissa Blackpink",bio: "I'm member of Blackpink", email: "lisa@blackpink.com")
    ]
}

