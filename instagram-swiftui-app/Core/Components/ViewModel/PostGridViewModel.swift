//
//  PostGridViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    
    init(user: User){
        self.user = user
        Task {
            try await fetchUserPost()
        }
    }
    
    @MainActor
    func fetchUserPost() async throws {
        self.posts = try await PostService.fetchUserPost(withUid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
