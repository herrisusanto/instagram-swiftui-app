//
//  ChatService.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import Foundation
import Firebase


struct ChatService {
    let chatPartner: User
    
    func sendMessage(_ messageText: String) {
        
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id
        
        let currentUserRef = FirebaseConstant.messageCollection.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = FirebaseConstant.messageCollection.document(chatPartnerId).collection(currentUid)
        
        
        let recentCurrentUserRef = FirebaseConstant.messageCollection.document(currentUid).collection("recent-messages").document(chatPartnerId)
        let recentPartnerRef = FirebaseConstant.messageCollection.document(chatPartnerId).collection("recent-messages").document(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(messageId: messageId,fromId: currentUid, toId: chatPartnerId, messageText: messageText, timestamp: Timestamp())
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
        recentCurrentUserRef.setData(messageData)
        recentPartnerRef.setData(messageData)
        
    }
    
    func observeMessage(completion: @escaping([Message]) -> Void ){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id
        
        let query = FirebaseConstant.messageCollection
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot , _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap({ try? $0.document.data(as: Message.self)})
            
            for (index, message) in messages.enumerated() where !message.isFromCurrentUser {
                messages[index].user = chatPartner
            }
            
            completion(messages)
        }
    }
}
