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
        let snapshot = try await FirebaseConstant.postCollection.getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.owner
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
    }
}
