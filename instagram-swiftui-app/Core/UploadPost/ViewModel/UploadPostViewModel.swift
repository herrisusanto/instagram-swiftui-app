//
//  UploadPostViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 25/01/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = FirebaseConstant.postCollection.document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage, type: .post) else { return }
        let post = Post(id: postRef.documentID, ownerId: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encodedPost)
    }
    
}

