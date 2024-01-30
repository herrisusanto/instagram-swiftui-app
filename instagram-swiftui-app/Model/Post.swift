//
//  Post.swift
//  instagram-swiftui-app
//
//  Created by loratech on 25/01/24.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let owner: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, owner: NSUUID().uuidString, caption: "I'm blackpink", likes: 1000, imageUrl: "jennie", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, owner: NSUUID().uuidString, caption: "I'm blackpink", likes: 1000, imageUrl: "jennie", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, owner: NSUUID().uuidString, caption: "I'm blackpink", likes: 1000, imageUrl: "jennie", timestamp: Timestamp(), user: User.MOCK_USERS[0])
    ]
}
