//
//  FeedView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 24/01/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0 ... 20, id: \.self){ post in
                        FeedCell()
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Image("instagram_logo_black")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 32)
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
