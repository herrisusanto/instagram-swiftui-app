//
//  FeedViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import Foundation
import Firebase

@MainActor
class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        Task {
            try await fetchPosts()
        } 
    }
    
    
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchPosts()
    }
}
