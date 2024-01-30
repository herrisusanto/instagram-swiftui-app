//
//  ContentViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 26/01/24.
//

import Foundation
import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject {
     
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let service = AuthService.shared
    private let userService = UserService.shared
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    @MainActor
    private func setupSubscribers() {
        service.$userSession.sink { [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellable)
        
        userService.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }.store(in: &cancellable)
    }
}
