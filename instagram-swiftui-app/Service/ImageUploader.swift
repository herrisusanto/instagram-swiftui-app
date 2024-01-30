//
//  ImageUploader.swift
//  instagram-swiftui-app
//
//  Created by loratech on 29/01/24.
//

import UIKit
import Firebase
import FirebaseStorage

enum ImageType {
    case profile
    case post
    
    var path: String {
        switch self {
        case .profile:
            return "/profile_image/"
        case .post:
            return "/post_image/"
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage,type: ImageType) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "\(type.path)\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed upload profile")
            return nil
        }
    }
}
