//
//  ActiveNowViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import Foundation
import Firebase

class ActiveNowViewModel: ObservableObject {
    @Published var users = [User]()
    
    init (){
        Task {
            try await fetchUsers()
        }
    }
    
    
    private func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers(limit: 10)
        self.users = users.filter({$0.id != currentUid})
    }
}
