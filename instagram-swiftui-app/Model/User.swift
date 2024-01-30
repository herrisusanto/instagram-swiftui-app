//
//  User.swift
//  instagram-swiftui-app
//
//  Created by loratech on 24/01/24.
//

import Foundation 
import Firebase


struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "jennie",profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagram-swiftui-app.appspot.com/o/profile_image%2F21B6516F-DAC9-4D0D-9ADA-E77F0A580978?alt=media&token=6068923f-a30d-46b7-8678-8caf4931224d",fullname: "Jennie Blackpink",bio: "I'm member of Blackpink", email: "jennie@blackpink.com"),
        .init(id: NSUUID().uuidString, username: "rose",profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagram-swiftui-app.appspot.com/o/profile_image%2F21B6516F-DAC9-4D0D-9ADA-E77F0A580978?alt=media&token=6068923f-a30d-46b7-8678-8caf4931224d",fullname: "Jennie Blackpink",bio: "I'm member of Blackpink", email: "jennie@blackpink.com"),
        .init(id: NSUUID().uuidString, username: "lisa",profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagram-swiftui-app.appspot.com/o/profile_image%2F21B6516F-DAC9-4D0D-9ADA-E77F0A580978?alt=media&token=6068923f-a30d-46b7-8678-8caf4931224d",fullname: "Lissa Blackpink",bio: "I'm member of Blackpink", email: "lisa@blackpink.com")
    ]
}

