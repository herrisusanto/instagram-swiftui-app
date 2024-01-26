//
//  Constants.swift
//  instagram-swiftui-app
//
//  Created by loratech on 26/01/24.
//

import Foundation
import Firebase

struct FirebaseConstant {
    
    static let userCollection = Firestore.firestore().collection("users")
    static let messageCollection = Firestore.firestore().collection("messages")
    
}


