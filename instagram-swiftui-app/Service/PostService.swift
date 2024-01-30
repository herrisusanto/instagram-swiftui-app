//
//  PostService.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import Firebase

struct PostService {
    
    static func fetchPosts() async throws -> [Post] {
        let snapshot = try await FirebaseConstant.postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
        
        for i in 0 ..< posts.count {
            let ownerId = posts[i].ownerId
            let postUser = try await UserService.fetchUser(withUid: ownerId)
            posts[i].user = postUser
        }
        return posts
    }
    
    static func fetchUserPost(withUid uid: String) async throws -> [Post] {
        let snapshot = try await FirebaseConstant.postCollection.whereField("ownerId", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({try $0.data(as: Post.self)})
    }
}
