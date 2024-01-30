//
//  InboxViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject {
    
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()
    
    private var cancellable = Set<AnyCancellable>()
    
    
    private func setupSubscribers() async throws {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellable)
        
//        InboxService.shared.$documentChanges.sink { [weak self] changes in
//            try await self?.loadInitialMessages(fromChanges: changes)
//        }.store(in: &cancellable)
    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]) async throws {
        var messages = changes.compactMap({ try? $0.document.data(as: Message.self)})
        
        for i in 0 ..< messages.count {
            let message = messages[i]
            
            let user = try await UserService.fetchUser(withUid: message.chatPartnerId)
            messages[i].user = user
            self.recentMessages.append(messages[i])
        }
    }
}
