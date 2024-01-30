//
//  AuthService.swift
//  instagram-swiftui-app
//
//  Created by loratech on 26/01/24.
//

import Foundation
import Firebase
import FirebaseAuth


class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print("DEBUG: Failed to login with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do { 
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, email: email, username: username)
        } catch {
            print("DEBUG: Failed to register with error: \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(uid: String, email: String, username: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        
        try? await FirebaseConstant.userCollection.document(user.id).setData(encodedUser)
    }
    
    private func loadCurrentUserData(){
        Task {
           try await UserService.shared.fetchCurrentUser()
        }
    }
    
    @MainActor
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.currentUser = nil
    }
}
