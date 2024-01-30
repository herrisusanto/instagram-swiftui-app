//
//  SearchViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 26/01/24.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers() 
    }
}
