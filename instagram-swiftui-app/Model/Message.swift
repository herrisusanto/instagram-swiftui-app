//
//  Message.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
    
    var timestampString: String {
        return timestamp.dateValue().timestampString()
    }
    
}

extension Message {
    static let MOCK_MESSAGES:[Message] = [
        .init(messageId: NSUUID().uuidString, fromId: "39RmNhxJwERQf7aBUmjM0s6QCYK2", toId: "TNvCRSaL6fOoRAn3GDekYMnRZkc2", messageText: "How are you today?", timestamp: Timestamp(seconds:1705400607, nanoseconds:87165000), user: User(id: NSUUID().uuidString, username: "jennie",profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagram-swiftui-app.appspot.com/o/profile_image%2F21B6516F-DAC9-4D0D-9ADA-E77F0A580978?alt=media&token=6068923f-a30d-46b7-8678-8caf4931224d",fullname: "Jennie Blackpink",bio: "I'm member of Blackpink", email: "jennie@blackpink.com")),
        .init(messageId: NSUUID().uuidString, fromId: "39RmNhxJwERQf7aBUmjM0s6QCYK2", toId: "TNvCRSaL6fOoRAn3GDekYMnRZkc2", messageText: "How are you today?", timestamp: Timestamp(seconds:1705400607, nanoseconds:87165000), user: User(id: NSUUID().uuidString, username: "jennie",profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagram-swiftui-app.appspot.com/o/profile_image%2F21B6516F-DAC9-4D0D-9ADA-E77F0A580978?alt=media&token=6068923f-a30d-46b7-8678-8caf4931224d",fullname: "Jennie Blackpink",bio: "I'm member of Blackpink", email: "jennie@blackpink.com")),
        .init(messageId: NSUUID().uuidString, fromId: "39RmNhxJwERQf7aBUmjM0s6QCYK2", toId: "TNvCRSaL6fOoRAn3GDekYMnRZkc2", messageText: "How are you today?", timestamp: Timestamp(seconds:1705400607, nanoseconds:87165000), user: User(id: NSUUID().uuidString, username: "jennie",profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/instagram-swiftui-app.appspot.com/o/profile_image%2F21B6516F-DAC9-4D0D-9ADA-E77F0A580978?alt=media&token=6068923f-a30d-46b7-8678-8caf4931224d",fullname: "Jennie Blackpink",bio: "I'm member of Blackpink", email: "jennie@blackpink.com"))
    ]
}
