//
//  PostGridView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 25/01/24.
//

import SwiftUI

struct PostGridView: View {
    let posts: [Post]
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1){
            ForEach(posts){ post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageDimension, height: imageDimension)
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}
