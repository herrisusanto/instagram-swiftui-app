//
//  ProfileViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 29/01/24.
//

import SwiftUI
import PhotosUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var profileImage: Image?
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task {
                try await loadImage()
            }
        }
    }
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User){
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage() async throws {
        guard let item = selectedItem else { return }
        guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: imageData) else { return }
        
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    @MainActor
    func updateUserData() async throws {
        
        var data = [String: Any]()
        
        if let uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage, type: .profile)
            data["profileImageUrl"] = imageUrl
        }
        
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        if !data.isEmpty {
            print("data: \(data)")
            try await FirebaseConstant.userCollection.document(user.id).updateData(data)
        }
    }
}

