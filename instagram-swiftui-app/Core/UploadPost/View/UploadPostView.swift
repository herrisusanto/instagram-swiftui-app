//
//  UploadPostView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 25/01/24.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject  var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            HStack {
                Button{
                    clearPostDataAndReturnToFeed()
                }label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                
                Spacer()
                
                Button{
                    Task {
                        try await viewModel.uploadPost(caption:caption)
                        clearPostDataAndReturnToFeed()
                    }
                }label:{
                    Text("Upload")
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                
                TextField("Enter your caption...", text: $caption)
            }
            .padding()
            
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
    
    func clearPostDataAndReturnToFeed(){
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
