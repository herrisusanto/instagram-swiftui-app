//
//  InboxService.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import Foundation
import Firebase


class InboxService: ObservableObject {
    
    @Published var documentChanges = [DocumentChange]()
    
    static let shared = InboxService()
    
    func observeRecentMessages(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = FirebaseConstant.messageCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot , _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added || $0.type == .modified }) else { return }
            
            self.documentChanges = changes
        }
    }
}
