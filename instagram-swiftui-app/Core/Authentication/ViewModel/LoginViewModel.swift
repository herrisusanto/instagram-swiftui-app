//
//  LoginViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 26/01/24.
//

import Foundation 

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    
    var disableButton: Bool {
        if !email.isEmpty && !password.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    @MainActor
    func login() async throws {
        do {
            self.isLoading = true
            try await AuthService.shared.login(withEmail: email, password: password)
            self.isLoading = false
        } catch {
            self.isLoading = false
            print("DEBUG: Failed when try to login with error: \(error.localizedDescription)")
        }
        
    }
     
}
