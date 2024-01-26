//
//  CreateUserViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 26/01/24.
//

import Foundation

@MainActor
class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    @Published var isLoading = false
    
    var disableCompleteButton: Bool {
        if !email.isEmpty && !username.isEmpty && !password.isEmpty {
            return false
        }
        return true
    }
    
    
    func createUser() async throws {
        isLoading = true
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        isLoading = false
        
        email = ""
        username = ""
        password = ""
        
        
    }
}
